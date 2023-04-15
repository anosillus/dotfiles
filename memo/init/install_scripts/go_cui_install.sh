go install  github.com/golang/dep/cmd/dep@latest
go install  mvdan.cc/sh/cmd/shfmt@latest
go install  golang.org/x/tools/cmd/goimports@latest
go install  github.com/jackc/sqlfmt/@latest
go install  github.com/high-moctane/nextword@latest

go install github.com/mrtazz/checkmake@latest
cd $GOPATH/src/github.com/mrtazz/checkmake
make
