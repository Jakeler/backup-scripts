# Borg-custom-TAGs
Some tags to exclude specific directory types in Borg Backup.

Use the following options when creating a achive:
`--exclude-caches` (= excludes CACHEDIR.TAG)
`--exclude-if-present FILENAME` (eg. PUB_DL.TAG)
`--keep-tag-files` (backup the dir only with tag file)
