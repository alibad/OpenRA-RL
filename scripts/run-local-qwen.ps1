$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$cli = Join-Path $repoRoot '.venv\Scripts\openra-rl.exe'
$log = Join-Path $env:TEMP 'openra-rl-qwen-agent.log'

$Host.UI.RawUI.WindowTitle = 'OpenRA-RL - Qwen3 32B'
Set-Location -LiteralPath $repoRoot

& $cli play `
	--server-url 'http://127.0.0.1:8000' `
	--provider ollama `
	--model 'qwen3:32b' `
	--difficulty easy `
	--verbose 2>&1 |
	Tee-Object -FilePath $log

Write-Host "Agent exited with code $LASTEXITCODE. Log: $log"
