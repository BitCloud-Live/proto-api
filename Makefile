gen-go:
	protoc -I ./proto -I$$GOPATH/src -I$$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --go_out=plugins=grpc:./proto  --grpc-gateway_out=logtostderr=true:./proto YB.proto
