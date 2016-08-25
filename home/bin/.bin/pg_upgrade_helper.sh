## Set the old version that we want to upgrade from.
# export FROM_VERSION=9.4

if [ -z "$FROM_VERSION" ]; then
  echo "Missing: FROM_VERSION"
  exit
fi

pacman -S --needed postgresql-old-upgrade
chown postgres:postgres /var/lib/postgres/
su - postgres -c "mv /var/lib/postgres/data /var/lib/postgres/data-${FROM_VERSION}"
su - postgres -c 'mkdir /var/lib/postgres/data'
su - postgres -c "initdb --locale $LANG -E UTF8 -D /var/lib/postgres/data"
su - postgres -c "pg_upgrade -b /opt/pgsql-${FROM_VERSION}/bin/ -B /usr/bin/ -d /var/lib/postgres/data-${FROM_VERSION} -D /var/lib/postgres/data"
