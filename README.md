# .files
It's my .files uses to develop go based application, I will keep it up to date as possible as I can accroding to my coding exp.

### Requirement
Vim 7+ version with Lua installed. 
To verify this, you have to run `vim --version` to check with the vim
version. And running `:echo has('lua')` to verify that if `1` will be
returned.                                                            

### Usage
By using this `.vimrc` file, you'd install a few external tools:
1). Tools for Gotag => `go get -u github.com/jstemmer/gotags`
2). Install CTags => `brew install ctags`
3). Run vim command => `:PlugIntall`
4). Run command for go-vim plugin => `:GoInstallBinaries`
