{{/*
Expand the name of the chart.
*/}}
{{- define "generic.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "generic.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "generic.chart" -}}
{{- printf "%s-%s" .Chart.Name (default .Chart.Version .Values.versionOverride) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "generic.labels" -}}
helm.sh/chart: {{ include "generic.chart" . }}
{{ include "generic.selectorLabels" . }}
{{- if  or (.Chart.AppVersion) (.Values.appVersionOverride) }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.appVersionOverride | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "generic.selectorLabels" -}}
app.kubernetes.io/name: {{ include "generic.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "generic.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "generic.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "generic.probes.httpGet" -}}
httpGet:
  path: {{ .Values.probes.options.path }}
  port: {{ .Values.probes.options.port }}
{{- end -}}

{{- define "generic.probes.tcpSocket" -}}
tcpSocket:
  port: {{ .Values.probes.options.port }}
{{- end -}}

{{- define "generic.probes.exec" -}}
exec:
  command:
    {{- .Values.probes.options.command | toYaml | nindent 2 }}
{{- end -}}

{{- define "generic.probes" -}}
{{- if eq .Values.probes.type "httpGet" -}}
{{ include "generic.probes.httpGet" . }}
{{- end }}
{{- if eq .Values.probes.type "tcpSocket" -}}
{{ include "generic.probes.tcpSocket" . }}
{{- end }}
{{- if eq .Values.probes.type "exec" -}}
{{ include "generic.probes.exec" . }}
{{- end }}
initialDelaySeconds: {{ .Values.probes.initialDelaySeconds }}
periodSeconds: {{ .Values.probes.periodSeconds }}
timeoutSeconds: {{ .Values.probes.timeoutSeconds }}
successThreshold: {{ .Values.probes.successThreshold }}
failureThreshold: {{ .Values.probes.failureThreshold }}
{{- end }}

{{- define "generic.checksums" -}}
checksum/configmap: {{ .Values.config | toString | sha256sum }}
checksum/secrets: {{ .Values.secrets | toString | sha256sum }}
{{- end }}
