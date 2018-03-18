$html = @"
<title>This is the title</title>
<h1>Hello world</h1>
<h2>$(Get-Date)</h2>
"@

@{
    headers = @{ "content-type" = "text/html" }
    body    = $html
} | ConvertTo-Json > $res