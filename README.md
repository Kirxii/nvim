# Installation guide

## Windows

Run powershell.exe and run the following commands

```powershell
winget install Git.Git; winget install Zig.Zig; winget install Wezterm.Wezterm; start-process powershell -ArgumentList '-NoExit', '-Command', 'git clone github.com/kirxii/wezterm ~/; git clone github.com/kirxii/nvim ~/Appdata/Local/; wezterm start nvim'; exit
```
