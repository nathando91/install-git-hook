#!/bin/sh

# Định nghĩa URL của script hook
HOOK_SCRIPT_URL="https://example.com/user/repo/install-git-hook.sh"

# Đường dẫn tới thư mục git hooks cục bộ
# Thay đổi "your_repo" bằng đường dẫn tới repo git cục bộ của bạn
GIT_HOOKS_PATH="your_repo/.git/hooks/pre-commit"

# Tải script hook và lưu vào thư mục git hooks cục bộ
curl -Ls $HOOK_SCRIPT_URL -o $GIT_HOOKS_PATH

# Đặt quyền thực thi cho script
chmod +x $GIT_HOOKS_PATH

echo "Git hook script has been installed."
