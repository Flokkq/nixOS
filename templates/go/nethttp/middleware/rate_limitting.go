package middleware

import (
	"net/http"
	"sync"
	"time"
)

var (
	mu         sync.Mutex
	reqCount   int
	resetTimer *time.Timer
)

const (
	limit      = 100
	resetAfter = time.Hour
)

func init() {
	resetRateLimiter()
}

func resetRateLimiter() {
	mu.Lock()
	defer mu.Unlock()

	if resetTimer != nil {
		resetTimer.Stop()
	}
	reqCount = 0
	resetTimer = time.AfterFunc(resetAfter, resetRateLimiter)
}

func RateLimiter(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		mu.Lock()
		if reqCount >= limit {
			mu.Unlock()
			w.WriteHeader(http.StatusTooManyRequests)
			w.Write([]byte("Rate limit exceeded. Please open an issue on GitHub or contact the maintainer on Discord"))
			return
		}
		reqCount++
		mu.Unlock()

		next.ServeHTTP(w, r)
	})
}
