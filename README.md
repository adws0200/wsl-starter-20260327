# wsl-starter-20260327

WSL 开发起手模板（Node.js + Python 双栈）。

## 已完成
- GitHub SSH 打通
- 仓库初始化并推送
- Node.js / npm / pnpm 可用
- Python3 / pip / venv 可用

## 目录结构

- `src/index.js`：Node 示例入口
- `app/main.py`：Python 示例入口
- `scripts/bootstrap.sh`：本地自检脚本

## 快速开始

```bash
# Node
npm run dev

# Python
npm run py
```

## 可用脚本

```bash
npm run dev      # 运行 Node 示例
npm run py       # 运行 Python 示例
npm run check    # 同时检查 node/python 版本
npm run bootstrap
```
