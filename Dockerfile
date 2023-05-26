# Dockerfile
FROM golang:1.16-alpine

WORKDIR /app

COPY main.go ./

# Go 모듈 초기화 및 의존성 다운로드
RUN go mod init github.com/bnuazz15/golang-backend-sample
RUN go mod tidy

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]
