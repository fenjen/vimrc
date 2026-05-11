https://github.com/fenjen/vimrc/tree/dist

# Linux
- system: `/etc/vim/vimrc`
- user: `~/.vimrc`

```bash
# system (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -O /etc/vim/vimrc
```
```bash
# system (curl)
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -o /etc/vim/vimrc 
```
```bash
# user (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -O ~/.vimrc
```
```bash
# user (curl)
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/linux/vimrc' -o ~/.vimrc
```

# WSL
- system: `/etc/vim/vimrc`
- user: `~/.vimrc`

```bash
# system (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -O /etc/vim/vimrc
```
```bash
# system (curl)
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -o /etc/vim/vimrc
```
```bash
# user (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -O ~/.vimrc
```
```bash
# user (curl)
curl -fsSL 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/wsl/vimrc' -o ~/.vimrc
```

# Windows
- System: `C:\Program Files\Vim\_vimrc`
- User: `$HOME\_vimrc` (powershell.exe)
- User: `%USERPROFILE%\_vimrc` (cmd.exe)

## powershell
```powershell
# system (iwr)
iwr 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -OutFile 'C:\Program Files\Vim\_vimrc'
```
```powershell
# system (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -O 'C:\Program Files\Vim\_vimrc'
```
```powershell
# user (iwr)
iwr 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -OutFile $HOME\_vimrc
```
```powershell
# user (wget)
wget 'https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc' -O $HOME\_vimrc
```

## cmd
```powershell
# system (wget)
wget "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -O "C:\Program Files\Vim\_vimrc"
```
```powershell
# system (curl)
curl -fsSL "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -o "C:\Program Files\Vim\_vimrc"
```
```powershell
# user (wget)
wget "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -O %USERPROFILE%\_vimrc
```
```powershell
# user (curl)
curl -fsSL "https://raw.githubusercontent.com/fenjen/vimrc/refs/heads/dist/windows/_vimrc" -o %USERPROFILE%\_vimrc
```
