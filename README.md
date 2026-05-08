https://github.com/fenjen/vimrc/tree/dist

# Linux
- Global: `/etc/vim`
- User: `~`

```bash
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -o ~/.vimrc 
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -o /etc/vim/vimrc 
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -O ~/.vimrc
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -O /etc/vim/vimrc
```

# WSL
- Global: `/etc/vim`
- User: `~`

```bash
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -o ~/.vimrc
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -o /etc/vim/vimrc
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -o ~/.vimrc
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -O /etc/vim/vimrc
```

# Windows
- Global: `C:\Program Files\Vim`
- User: `%USERPROFILE%`

```powershell
# cmd
curl -fsSL "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -o %USERPROFILE%\_vimrc
curl -fsSL "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -o "C:\Program Files\Vim\_vimrc"
iwr 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -OutFile $HOME\_vimrc
iwr 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -OutFile 'C:\Program Files\Vim\_vimrc'
```
