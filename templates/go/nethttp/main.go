package main

import (
	"fmt"
	"net/http"
	"server/middleware"
)

func main() {
	router := http.NewServeMux()

	stack := middleware.CreateStack(
		middleware.Logging,
		middleware.IsAuthenticated,
		middleware.RateLimiter,
	)

	server := http.Server{
		Addr:    ":8080",
		Handler: stack(router),
	}

	fmt.Println("Server listening on port", server.Addr)
	if err := server.ListenAndServe(); err != nil {
		fmt.Printf("Error starting server: %v\n", err)
	}
}
