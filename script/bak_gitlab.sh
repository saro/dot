#!/bin/bash

# set -x
# trap read debug

GITLAB_VOL_ROOT=/srv/gitlab
GITLAB_CONFIG_DIR="${GITLAB_VOL_ROOT}/config"
GITLAB_RAKE_DIR="${GITLAB_VOL_ROOT}/data/backups"

GITLAB_DOCK_NAME=gitlab

DEST_LOCAL_DIR=/root/backup
DEST_REMOTE_DIR=/root/smb/gitlab

BACKUP_BASENAME=gitlab_bak
BACKUP_DATE_FORMAT="%Y%m%d"

TMP_DIR=${BACKUP_BASENAME}_$(date +"${BACKUP_DATE_FORMAT}")

mkdir -p /tmp/${TMP_DIR}

# Run gitlab-rake
docker exec -t ${GITLAB_DOCK_NAME} gitlab-rake gitlab:backup:create
GITLAB_RAKE_LAST="$(ls ${GITLAB_RAKE_DIR}|grep "$(date +"%Y_%m_%d")"|sort -r|head -n1)"
cp "${GITLAB_RAKE_DIR}/${GITLAB_RAKE_LAST}" /tmp/${TMP_DIR}

# Create tarball with gitlab config
GITLAB_CONFIG_TMP="gitlab_config_$(date +"${BACKUP_DATE_FORMAT}").tar.gz"
tar czf /tmp/${TMP_DIR}/${GITLAB_CONFIG_TMP} ${GITLAB_CONFIG_DIR} 2>&1 | grep -v  "Removing leading"

# Create unified local backup
tar czf "${DEST_LOCAL_DIR}/${BACKUP_BASENAME}_$(date +"${BACKUP_DATE_FORMAT}").tar.gz"  -C /tmp "${TMP_DIR}/${GITLAB_RAKE_LAST}" "${TMP_DIR}/${GITLAB_CONFIG_TMP}" 2>&1 | grep -v  "Removing leading"
# Clean up /tmp/
rm -r "/tmp/${BACKUP_BASENAME}_$(date +"${BACKUP_DATE_FORMAT}")/"

# Copy backup on remote directory using the day of the year number
cp "${DEST_LOCAL_DIR}/${BACKUP_BASENAME}_$(date +"${BACKUP_DATE_FORMAT}").tar.gz" "${DEST_REMOTE_DIR}/${BACKUP_BASENAME}_$(date +"%j").tar.gz"


