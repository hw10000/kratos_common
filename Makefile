# Go参数
GO := go
GOPATH := $(shell $(GO) env GOPATH)
VERSION := $(shell git describe --tags --always)

# Protobuf参数
PROTO_PATH := ./comproto
PKG_PROTO_FILES := $(shell find $(PROTO_PATH) -name "*.proto")

# 确保使用正确的protoc插件版本
.PHONY: install-tools
install-tools:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# 生成protobuf代码
.PHONY: proto
proto: install-tools
	@echo "生成protobuf代码..."
	protoc --proto_path=$(PROTO_PATH) \
		--go_out=paths=source_relative:$(PROTO_PATH) \
		--go-grpc_out=paths=source_relative:$(PROTO_PATH) \
		$(PKG_PROTO_FILES)
	@echo "protobuf代码生成完成"

# 清理生成的文件
.PHONY: clean
clean:
	@echo "清理生成的代码..."
	@find $(PROTO_PATH) -name "*.pb.go" -delete
	@echo "清理完成"