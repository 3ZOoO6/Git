﻿#
# Module manifest for module 'ThreadJob'
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\ThreadJob.dll'

# Version number of this module.
ModuleVersion = '1.1.2'

# ID used to uniquely identify this module
GUID = '29955884-f6a6-49ba-a071-a4dc8842697f'

Author = 'Microsoft Corporation'
CompanyName = 'Microsoft Corporation'
Copyright = '(c) Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = "
PowerShell's built-in BackgroundJob jobs (Start-Job) are run in separate processes on the local machine.
They provide excellent isolation but are resource heavy.  Running hundreds of BackgroundJob jobs can quickly
absorb system resources.

This module extends the existing PowerShell BackgroundJob to include a new thread based ThreadJob job.  This is a 
lighter weight solution for running concurrent PowerShell scripts that works within the existing PowerShell job 
infrastructure.

ThreadJob jobs will tend to run quicker because there is lower overhead and they do not use the remoting serialization 
system.  And they will use up fewer system resources.  In addition output objects returned from the job will be
'live' since they are not re-hydrated from the serialization system.  However, there is less isolation.  If one
ThreadJob job crashes the process then all ThreadJob jobs running in that process will be terminated.

This module exports a single cmdlet, Start-ThreadJob, which works similarly to the existing Start-Job cmdlet.
The main difference is that the jobs which are created run in separate threads within the local process.

One difference is that ThreadJob jobs support a ThrottleLimit parameter to limit the number of running jobs,
and thus active threads, at a time.  If more jobs are started then they go into a queue and wait until the current
number of jobs drops below the throttle limit.

Added Runspace cleanup.
Added Using variable expression support.
"

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Cmdlets to export from this module
CmdletsToExport = 'Start-ThreadJob'

}

# SIG # Begin signature block
# MIIphQYJKoZIhvcNAQcCoIIpdjCCKXICAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAt9rIUS5FzSYDI
# k1L0JNRNaCz8Acj4jYUYSuJmFIagZaCCDYEwggX/MIID56ADAgECAhMzAAABA14l
# HJkfox64AAAAAAEDMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMTgwNzEyMjAwODQ4WhcNMTkwNzI2MjAwODQ4WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDRlHY25oarNv5p+UZ8i4hQy5Bwf7BVqSQdfjnnBZ8PrHuXss5zCvvUmyRcFrU5
# 3Rt+M2wR/Dsm85iqXVNrqsPsE7jS789Xf8xly69NLjKxVitONAeJ/mkhvT5E+94S
# nYW/fHaGfXKxdpth5opkTEbOttU6jHeTd2chnLZaBl5HhvU80QnKDT3NsumhUHjR
# hIjiATwi/K+WCMxdmcDt66VamJL1yEBOanOv3uN0etNfRpe84mcod5mswQ4xFo8A
# DwH+S15UD8rEZT8K46NG2/YsAzoZvmgFFpzmfzS/p4eNZTkmyWPU78XdvSX+/Sj0
# NIZ5rCrVXzCRO+QUauuxygQjAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUR77Ay+GmP/1l1jjyA123r3f3QP8w
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDM3OTY1MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAn/XJ
# Uw0/DSbsokTYDdGfY5YGSz8eXMUzo6TDbK8fwAG662XsnjMQD6esW9S9kGEX5zHn
# wya0rPUn00iThoj+EjWRZCLRay07qCwVlCnSN5bmNf8MzsgGFhaeJLHiOfluDnjY
# DBu2KWAndjQkm925l3XLATutghIWIoCJFYS7mFAgsBcmhkmvzn1FFUM0ls+BXBgs
# 1JPyZ6vic8g9o838Mh5gHOmwGzD7LLsHLpaEk0UoVFzNlv2g24HYtjDKQ7HzSMCy
# RhxdXnYqWJ/U7vL0+khMtWGLsIxB6aq4nZD0/2pCD7k+6Q7slPyNgLt44yOneFuy
# bR/5WcF9ttE5yXnggxxgCto9sNHtNr9FB+kbNm7lPTsFA6fUpyUSj+Z2oxOzRVpD
# MYLa2ISuubAfdfX2HX1RETcn6LU1hHH3V6qu+olxyZjSnlpkdr6Mw30VapHxFPTy
# 2TUxuNty+rR1yIibar+YRcdmstf/zpKQdeTr5obSyBvbJ8BblW9Jb1hdaSreU0v4
# 6Mp79mwV+QMZDxGFqk+av6pX3WDG9XEg9FGomsrp0es0Rz11+iLsVT9qGTlrEOla
# P470I3gwsvKmOMs1jaqYWSRAuDpnpAdfoP7YO0kT+wzh7Qttg1DO8H8+4NkI6Iwh
# SkHC3uuOW+4Dwx1ubuZUNWZncnwa6lL2IsRyP64wggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIbWjCCG1YCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAQNeJRyZH6MeuAAAAAABAzAN
# BglghkgBZQMEAgEFAKCBvDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgFN0Om3sb
# fgh75BhXba9QmO+KQGxP26na9ayYxeKRQD8wUAYKKwYBBAGCNwIBDDFCMECgFoAU
# AFAAbwB3AGUAcgBTAGgAZQBsAGyhJoAkaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L1Bvd2VyU2hlbGwgMA0GCSqGSIb3DQEBAQUABIIBAHHhn1uDocaNQgX00GEmTrLJ
# fsJaPLEpeZq6MJ1lC0wB+qc2lcfhVXTlHz2RVKsY0TOKFBRHjHEhr0fVVdAR9XYn
# NABSsFpQ9F6Z2b2PRa2kbnKj/5cug8ApaA6G1lMx4NzlIylLGaygxHXSUxlnhsMx
# 5jFTOJ2ONqEjxEthJptURgs3KDnaj2FL7GFHHRbdv3cLNNsxIYeQ09VzJA8sIAxu
# qmW02dwnZtuEEpczUHh6Y6yoGJRxUPpBXuc6Oc4HlLtUSmCfSHFpOcU8QwfhBxs8
# PFB7utgTjIIE8SUx8PpjperKv/rVW9uBlMIfWbVMdr0v4f0h9AZym3XNtVwTRdah
# ghjWMIIY0gYKKwYBBAGCNwMDATGCGMIwghi+BgkqhkiG9w0BBwKgghivMIIYqwIB
# AzEPMA0GCWCGSAFlAwQCAQUAMIIBUQYLKoZIhvcNAQkQAQSgggFABIIBPDCCATgC
# AQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQgsrNZpaW2/1tUap01bEue
# BrzvqcuOluc6YvxTJIFf0OICBltVnjfWZhgTMjAxODA4MTMyMjQ3NTAuNzkxWjAE
# gAIB9KCB0KSBzTCByjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAldBMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNV
# BAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UE
# CxMdVGhhbGVzIFRTUyBFU046QTg0MS00QkI0LUNBOTMxJTAjBgNVBAMTHE1pY3Jv
# c29mdCBUaW1lLVN0YW1wIHNlcnZpY2WgghQtMIIE8TCCA9mgAwIBAgITMwAAAMHl
# +LT9DneYPwAAAAAAwTANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMDAeFw0xODAxMzExOTAwNDRaFw0xODA5MDcxOTAwNDRaMIHKMQsw
# CQYDVQQGEwJVUzELMAkGA1UECBMCV0ExEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IEly
# ZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVT
# TjpBODQxLTRCQjQtQ0E5MzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# c2VydmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKP+nnUoLXw7
# M+3uJj7GPVho/DO38fPvVqFhXJhTuIUXkhe4bSuRSgNO1R/ZBRKuInSuq3Wu9Wqo
# Vq3/4J9necFWjSg9dn6yEdDlbEHISUNJc846zhox5zVeXyopSnB7liAXtOJdHxYT
# /1T1v3gz9/55KwY35LX4/Q8rpSVDJjcT0L7m+Np0LF5Ij/y2pNA8pmYvT2ESDLvU
# STt7KG98t774RAWx23G5AJ3PmfN4ziuNo+ZbguVZmbULcYhmTGgvAS4xSWiU1GRh
# hId8VxU3qOIwt/ZNyraknqQly8L600+Ip3EslMuVL/ANNHKjgw7PV7h0njAvh4qr
# 5DOamSjljGMCAwEAAaOCARswggEXMB0GA1UdDgQWBBSgw0hV17Eo85XUxNLMozj8
# HKQxfzAfBgNVHSMEGDAWgBTVYzpcijGQ80N7fEYbxTNoWoVtVTBWBgNVHR8ETzBN
# MEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0
# cy9NaWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcmwwWgYIKwYBBQUHAQEETjBMMEoG
# CCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
# Y1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQM
# MAoGCCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4IBAQCjcZUnzcXkZ7nJV2JDjir8
# EMop7ZLI6cmL7oH+VGM+lqV0TtLY6SIKO6OCijvA0YwIoOCJjKj8DvpurbAG3Xdq
# Cq2FWHypU/HQFBtIkdhaNo54aEO8rdjclOYbJeA9GI/kRfXedzLOEuiVZ0/Dgl+v
# 4hjI3NSac2nbpS76d5nwfXDjb/WULySrWzXNAm7IEs/rbBBw0+3qY9rBDix+Kdj9
# 4a8r4GH54/Iu2tMwfW7RyF4uZTVLennHPPfFhJeG+I/bwUWLyc54I8YtKzP9jQ0f
# 06ZqEvtb/ypEFI6wW5x+nw9hV54zhXyoZgu+ZxpzLfd4XzAT/78Pf4gnbPkrz1qC
# MIIF7TCCA9WgAwIBAgIQKMw6Jb+6RKxEmptYa0M5qjANBgkqhkiG9w0BAQsFADCB
# iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMp
# TWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAw
# NjIzMjE1NzI0WhcNMzUwNjIzMjIwNDAxWjCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQC5CJ4o5OTsBk5QaLNBxXvrrraOr4G6IkQfZTRpTL5wQBfyFnvief2G7Q05
# 9BuorZKQHss9do9a2bWREC48BY2KbSRU5x/tVq2DtFCcFaUXdIhZIPwIxYR202jU
# byh4zly481CQRP/jY1++oZoslhUE1gf+HoQh4EIxEcQoNpTPUKRinsnWq3EAslsM
# 5pbUCiSW9f/G1bcb18u3IWKvEtyhXTfjGvsaRpjAm8DnYx8qCJMCfh5qjvKfGInk
# IoWisYRXQP/1DthvnO3iRTEBzRfpf7CBReOqIUAmoXKqp088AQV+7oNYsV4GY5li
# kXiCtw2TDCRqtBvbJ+xflQQ/k0ow9ZcYs6f5GaeTMx0ByNsiUlzXJclG+aL7h1lD
# vptisY0thkQaRqx4YX4wCfquicRBKiJmA5E5RZzHiwyoyg0v+1LqDPdjMyOd/rAf
# rWfWp1ADxgRwY7UssYZaQ7f7rvluKW4hIUEmBozJw+6wwoWTobmF2eYybEtMP9Zd
# o+W1nXfDnMBVt3QA47g4q4OXUOGaQiQdxsCjMNEaWshSNPdz8ccYHzOteuzLQWDz
# I5QgwkhFrFxRxi6AwuJ3Fb2Fh+02nZaR7gC1o3Dsn+ONgGiDdrqvXXBSIhbiZvu6
# s8XC9z4vd6bK3sGmxkhMwzdRI9Mn17hOcJbwoUR2r3jPmuFmEwIDAQABo1EwTzAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU1fZWy4/oolxi
# aNE9lJBb186aGMQwEAYJKwYBBAGCNxUBBAMCAQAwDQYJKoZIhvcNAQELBQADggIB
# AKylloy/u66m9tdxh0MxVoj9HDJxWzW31PCR8q834hTx8wImBT4WFH8UurhP+4my
# sufUCcxtuVs7ZGVwZrfysVrfGgLz9VG4Z215879We+SEuSsem0CcJjT5RxiYadgc
# 17bRv49hwmfEte9gQ44QGzZJ5CDKrafBsSdlCfjN9Vsq0IQz8+8f8vWcC1iTN6B1
# oN5y3mx1KmYi9YwGMFafQLkwqkB3FYLXi+zA07K9g8V3DB6urxlToE15cZ8PrzDO
# Z/nWLMwiQXoH8pdCGM5ZeRBV3m8Q5Ljag2ZAFgloI1uXLiaaArtXjMW4umliMoCJ
# nqH9wJJ8eyszGYQqY8UAaGL6n0eNmXpFOqfp7e5pQrXzgZtHVhB7/HA2hBhz6u/5
# l02eMyPdJgu6Krc/RNyDJ/+9YVkrEbfKT9vFiwwcMa4y+Pi5Qvd/3GGadrFaBOER
# PWZFtxhxvskkhdbz1LpBNF0SLSW5jaYTSG1LsAd9mZMJYYF0VyaKq2nj5NnHiMwk
# 2OxSJFwevJEU4pbe6wrant1fs1vb1ILsxiBQhyVAOvvH7s3+M+Vuw4QJVQMlOcDp
# NV1lMaj2v6AJzSnHszYyLtyV84PBWs+LjfbqsyH4pO0eMQ62TBGrYAukEiMiF6M2
# ZIKRBBLgq28ey1AFYbRA/1mGcdHVM2l8qXOKONdkDPFpMIIGcTCCBFmgAwIBAgIK
# YQmBKgAAAAAAAjANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzAxMjEzNjU1WhcNMjUwNzAxMjE0
# NjU1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCASIwDQYJKoZIhvcN
# AQEBBQADggEPADCCAQoCggEBAKkdDbx3EYo6IOz8E5f1+n9plGt0VBDVpQoAgoX7
# 7XxoSyxfxcPlYcJ2tz5mK1vwFVMnBDEfQRsalR3OCROOfGEwWbEwRA/xYIiEVEMM
# 1024OAizQt2TrNZzMFcmgqNFDdDq9UeBzb8kYDJYYEbyWEeGMoQedGFnkV+BVLHP
# k0ySwcSmXdFhE24oxhr5hoC732H8RsEnHSRnEnIaIYqvS2SJUGKxXf13Hz3wV3Ws
# vYpCTUBR0Q+cBj5nf/VmwAOWRH7v0Ev9buWayrGo8noqCjHw2k4GkbaICDXoeByw
# 6ZnNPOcvRLqn9NxkvaQBwSAJk3jN/LzAyURdXhacAQVPIk0CAwEAAaOCAeYwggHi
# MBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBTVYzpcijGQ80N7fEYbxTNoWoVt
# VTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0T
# AQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNV
# HR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9w
# cm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEE
# TjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2Nl
# cnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDCBoAYDVR0gAQH/BIGVMIGS
# MIGPBgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9QS0kvZG9jcy9DUFMvZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIwNB4y
# IB0ATABlAGcAYQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBlAG4AdAAu
# IB0wDQYJKoZIhvcNAQELBQADggIBAAfmiFEN4sbgmD+BcQM9naOhIW+z66bM9TG+
# zwXiqf76V20ZMLPCxWbJat/15/B4vceoniXj+bzta1RXCCtRgkQS+7lTjMz0YBKK
# dsxAQEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/xn/yN31aPxzymXlKkVIArzgPF/Uv
# eYFl2am1a+THzvbKegBvSzBEJCI8z+0DpZaPWSm8tv0E4XCfMkon/VWvL/625Y4z
# u2JfmttXQOnxzplmkIz/amJ/3cVKC5Em4jnsGUpxY517IW3DnKOiPPp/fZZqkHim
# bdLhnPkd/DjYlPTGpQqWhqS9nhquBEKDuLWAmyI4ILUl5WTs9/S/fmNZJQ96LjlX
# dqJxqgaKD4kWumGnEcua2A5HmoDF0M2n0O99g/DhO3EJ3110mCIIYdqwUB5vvfHh
# AN/nMQekkzr3ZUd46PioSKv33nJ+YWtvd6mBy6cJrDm77MbL2IK0cs0d9LiFAR6A
# +xuJKlQ5slvayA1VmXqHczsI5pgt6o3gMy4SKfXAL1QnIffIrE7aKLixqduWsqdC
# osnPGUFN4Ib5KpqjEWYw07t0MkvfY3v1mYovG8chr1m1rtxEPJdQcdeh0sVV42ne
# V8HR3jDA/czmTfsNv11P6Z0eGTgvvM9YBS7vDaBQNdrvCScc1bN+NR4Iuto229Nf
# j950iEkSoYICzjCCAjcCAQEwgfihgdCkgc0wgcoxCzAJBgNVBAYTAlVTMQswCQYD
# VQQIEwJXQTEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkE4NDEtNEJCNC1DQTkz
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBzZXJ2aWNloiMKAQEwBwYF
# Kw4DAhoDFQBkWmMXCNAVyMfdXagMHrZAdMJc8qCBgzCBgKR+MHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA3xx0ljAiGA8yMDE4
# MDgxNDA1MjAyMloYDzIwMTgwODE1MDUyMDIyWjB3MD0GCisGAQQBhFkKBAExLzAt
# MAoCBQDfHHSWAgEAMAoCAQACAh19AgH/MAcCAQACAhGuMAoCBQDfHcYWAgEAMDYG
# CisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEA
# AgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAP4jjkdng60MV7vDeJDLuRdN1GoJjLXUw
# my83rrWKQXHkilwyyi4j6WjR83uq0d2DGrTseKLjsRRCY06MXM3OO2zdjs6j77mz
# sAlz7LbG5gkNikRMEg0UU4/l0mHeMnD/IyWDLVO+x+EmJqLF/1JAC+THM4Z+wrqg
# 1QvrF7o5SqoxggMNMIIDCQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMAITMwAAAMHl+LT9DneYPwAAAAAAwTANBglghkgBZQMEAgEFAKCCAUowGgYJ
# KoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCCJXztZrgY3
# eOFB5lzJU2pPVCrc7q/N4d0M1FprZEFGTDCB+gYLKoZIhvcNAQkQAi8xgeowgecw
# geQwgb0EIDDFz0XaquH0WM6/4cCkzynQIOE57FkIUZcRH2JLwqs0MIGYMIGApH4w
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAADB5fi0/Q53mD8AAAAA
# AMEwIgQgohlkTKZ+t5yeUHJjqWnHNniLqQ2x/nzTbDyJ6v7qBUcwDQYJKoZIhvcN
# AQELBQAEggEAEPrijPy/J9PmA5R4vcF6/BNNKfi1vXFvClA56jGmwRhZ1OIiU6vy
# r0sQw+2J/zbJqH8VXnm5PO65mLywAuVyoJd35yIjIft+S1He2i3pcl1LMLKp6418
# RtBjaMoTvyzDr90DIMRgh+VHymHazy+HZOuxCi1vjvdFbdA0tk2+4sPCU3yAudTz
# ibKQzmj2Jd1YWKRxV6SF9gb4hLu1MaJYqPs2Rsw9WaJc+RjGD4H+FfsKfTucjf+J
# j3JDG9GKVedcyWPJwaTyfg93a7BLJYEFxYNSosMl4WlopT5QacKM7OUIdYAVLK8N
# fN4uYA5txj1SRcXMAByeTPUG2wRNRwBEZw==
# SIG # End signature block
