package middleware

import (
	"encoding/base64"
	"fmt"
	"net/http"
	"strings"
)

const AuthUserID = "middleware.auth.userID"

func writeUnauthed(w http.ResponseWriter) {
	w.WriteHeader(http.StatusUnauthorized)
	w.Write([]byte(http.StatusText(http.StatusUnauthorized)))
}

func IsAuthenticated(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		authorization := r.Header.Get("Authorization")

		if !strings.HasPrefix(authorization, "Bearer ") {
			writeUnauthed(w)
			return
		}

		encodedToken := strings.TrimPrefix(authorization, "Bearer ")

		token, err := base64.StdEncoding.DecodeString(encodedToken)
		if err != nil {
			writeUnauthed(w)
			return
		}

		userID := string(token)
		fmt.Println("userID:", userID)

		next.ServeHTTP(w, r)
	})
}
