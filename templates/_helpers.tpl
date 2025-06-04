{{- define "cidrapp.name" -}}
cidrapp
{{- end -}}

{{- define "cidrapp.fullname" -}}
{{ include "cidrapp.name" . }}
{{- end -}}

{{- define "cidrapp.labels" -}}
app.kubernetes.io/name: {{ include "cidrapp.name" . }}
helm.sh/chart: {{ include "cidrapp.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "cidrapp.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "cidrapp.serviceAccountName" -}}
{{- if .Values.serviceAccount.name }}
{{- .Values.serviceAccount.name | trim }}
{{- else }}
{{- include "cidrapp.fullname" . | trim }}
{{- end }}
{{- end }}

