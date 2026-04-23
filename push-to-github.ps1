# 推送到 GitHub 脚本
$repoPath = "C:\Users\Administrator\WorkBuddy\Claw\worker-index"

cd $repoPath

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  推送到 GitHub Pages" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "请输入你的 GitHub Personal Access Token:" -ForegroundColor Yellow
Write-Host "（输入时不会显示字符，这是正常的）" -ForegroundColor Gray
$secureToken = Read-Host -AsSecureString

# 将安全字符串转换为普通字符串
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)
$token = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

Write-Host ""
Write-Host "正在推送..." -ForegroundColor Green

# 使用 token 推送
git push https://m1234532:${token}@github.com/m1234532/worker-index.git main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  推送成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "网站将在 1-2 分钟后更新：" -ForegroundColor Cyan
    Write-Host "https://m1234532.github.io/worker-index/" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "推送失败，请检查 token 是否正确" -ForegroundColor Red
}

# 清理 token 变量
$token = $null
[GC]::Collect()

Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
