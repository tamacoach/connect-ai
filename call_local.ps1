param(
    [Parameter(Mandatory=$true)]
    [string]$Prompt
)

# 출력 인코딩을 UTF8로 설정
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$url = "http://localhost:11434/v1/chat/completions"
$body = @{
    model = "gemma4:e2b"
    messages = @(
        @{ role = "user"; content = $Prompt }
    )
    temperature = 0.1
} | ConvertTo-Json -Compress

try {
    $response = Invoke-RestMethod -Uri $url `
        -Method Post `
        -ContentType "application/json; charset=utf-8" `
        -Body $body
    
    # 모델 응답 콘텐츠만 추출
    if ($response.choices -and $response.choices[0].message) {
        $content = $response.choices[0].message.content
        Write-Output $content
    } else {
        Write-Output ($response | ConvertTo-Json -Depth 10 -Compress)
    }
} catch {
    Write-Error "Ollama 호출 중 오류 발생: $_"
}
