all: tmp install-protoc go-deps gen-go

tmp:
	mkdir -p tmp

install-protoc:
	wget https://github.com/protocolbuffers/protobuf/releases/download/v24.2/protoc-24.2-linux-x86_64.zip &&\
	mv protoc-24.2-linux-x86_64.zip tmp/ &&\
	cd tmp/ &&\
	unzip protoc-24.2-linux-x86_64.zip

go-deps:
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest &&\
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest &&\
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest


gen-go:
	PATH=${PATH}:${GOPATH}/bin ./tmp/bin/protoc -I ./proto -Itmp/include/google/protobuf -Iproto/google/api  --go_out ./proto --go_opt paths=source_relative --go-grpc_out ./proto --go-grpc_opt paths=source_relative --grpc-gateway_out ./proto --grpc-gateway_opt paths=source_relative ./proto/YB.proto
