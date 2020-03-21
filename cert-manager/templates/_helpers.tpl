{{/* declaring hosted zone id */}}
{{- define "hosted-zone-id" -}}
{{ index .Values "external-dns" "zoneIdFilters" 0 }}
{{- end -}}

{{/* declaring domain */}}
{{- define "domain" -}}
{{ index .Values "external-dns" "domainFilters" 0 }}
{{- end -}}

{{/* declaring wild card domain */}}
{{- define "wild-card-domain" -}}
*.{{ index .Values "external-dns" "domainFilters" 0 }}
{{- end -}}

{{/* declaring aws accessKey */}}
{{- define "accessKey" -}}
 {{ index .Values "external-dns" "aws" "credentials" "accessKey" }}
{{- end -}}

{{/* declaring base64 encoded aws secretKey */}}
{{- define "secretKey" -}}
 {{ index .Values "external-dns" "aws" "credentials" "secretKey" }}
{{- end -}}