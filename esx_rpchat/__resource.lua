resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Kontiz Advanced RP Chat'
shared_script 'config.lua'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/kontiz_sv.lua'
}
