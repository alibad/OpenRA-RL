$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$cli = Join-Path $repoRoot '.venv\Scripts\openra-rl.exe'

$Host.UI.RawUI.WindowTitle = 'OpenRA-RL - Qwen3 32B'
Set-Location -LiteralPath $repoRoot

& $cli play `
	--server-url 'http://127.0.0.1:8000' `
	--provider ollama `
	--model 'qwen3:32b' `
	--difficulty easy `
	--verbose
