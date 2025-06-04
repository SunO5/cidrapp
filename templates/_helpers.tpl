{{- define "cidrapp.name" -}}
cidrapp
{{- end }}

{{- define "cidrapp.fullname" -}}
{{ include "cidrapp.name" . }}
{{- end }}

