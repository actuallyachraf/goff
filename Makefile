# to bump version, git tag -a vX.X.X -m "version description" && git push origin --tags + modify following line
VERSION=v0.1.0
BUILD=`git rev-parse HEAD`
BUILD_TIME=`date +%FT%T`

LDFLAGS=-ldflags "-s -w -X github.com/consensys/goff/cmd.Version=${VERSION} -X github.com/consensys/goff/cmd.Build=${BUILD} -X github.com/consensys/goff/cmd.BuildTime=${BUILD_TIME}"

build:
	go vet -v && go build ${LDFLAGS} && go install ${LDFLAGS}
