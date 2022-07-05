# Hugo-stack-local-files
Overrides to disable all CDN and external font loading for Hugo-theme-stack

## How automation works

### check for outdated files

Run a job which downloads the latest external.yaml from upstream and then executes a script that compares the current YAML files hashes with the one in the repo, if there is no hash, it will compare SRC URLs.

Useful info:

https://stackoverflow.com/questions/8793558/compare-output-rather-than-command

Every file that's outdated will set a per-file output value to true.
Which will trigger a job to update the outdated file.

### Update file

it will download SHyaml, a dependency to extract values out of YAML files,
and then it downloads the latest file and moves it to static/js.

it will replace the hash in the external.yaml file with the new file's hash.

And if there is no hash, it will replace the original-src value, which is used to note which version is currently used, it has no use in the theme itself, it will replace it with the SRC in upstream.