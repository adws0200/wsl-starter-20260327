# wsl-starter-20260327

WSL 长期开发模板（Node.js + Python 双栈，含测试、CI、容器化、Git Hooks）。

## 你现在拿到的能力

- Node / Python 双服务（都提供 `/health`）
- Node + Python 单元测试
- CI 自动校验（check + lint + test）
- 本地初始化脚本
- Dockerfile + docker-compose
- 可选 pre-commit 质量门禁

## 快速开始

```bash
npm run check
npm run lint
npm run test
```

## 运行服务

```bash
# Node
npm run serve
# health: http://127.0.0.1:3000/health

# Python
npm run py:serve
# health: http://127.0.0.1:8000/health
```

## 常用命令

```bash
npm run dev          # Node 示例输出
npm run py           # Python 示例输出
npm run serve        # Node HTTP 服务
npm run py:serve     # Python HTTP 服务
npm run check        # 环境检查
npm run lint         # 语法/基础静态检查
npm run test         # 全量测试
npm run init:node    # Node 初始化
npm run init:python  # Python venv 初始化
npm run hooks:install
```

## Makefile 快捷入口

```bash
make check
make lint
make test
make serve
make py-serve
```

## 环境变量

```bash
cp .env.example .env
```

## 容器运行

```bash
docker compose up --build
```

- Node health: `http://127.0.0.1:3000/health`
- Python health: `http://127.0.0.1:8000/health`

## Git Hooks（可选）

安装后每次提交前自动跑 lint + test：

```bash
npm run hooks:install
```

## 目录结构

- `src/`：Node 代码
- `app/`：Python 代码
- `tests/node/`：Node 测试
- `tests/python/`：Python 测试
- `scripts/`：自动化脚本
- `.github/workflows/ci.yml`：CI 配置
