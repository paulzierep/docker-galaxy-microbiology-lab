# create static dump of the lab (does not properly render links)
chmod +x dump_static_lab.sh
./dump_static_lab.sh

# add frame fix (opens tool links on top frame), GTN in extra page, needs to be fixed by lab engine
cp frame-fix.js lab_interface/static/frame-fix.js
sed -i '/<\/body>/i <script src="static/frame-fix.js"><\/script>' \
lab_interface/welcome.html

# get all tools from codex
wget https://raw.githubusercontent.com/galaxyproject/galaxy_codex/refs/heads/main/communities/microgalaxy/lab/tools/all/Local_Galaxy.yaml
mv Local_Galaxy.yaml local_tools.yml

# set tool install to no deps, tools will be installed upon execution
sed -i \
  -e 's/^install_repository_dependencies: true$/install_repository_dependencies: false/' \
  -e 's/^install_resolver_dependencies: true$/install_resolver_dependencies: false/' \
  -e 's/^install_tool_dependencies: true$/install_tool_dependencies: false/' \
  local_tools.yml

# remove artic_guppyplex artic_minion since it has doublicated data table which kills Galaxy start up
awk '
  /^- name:/ {
    name = $3
    skip = (name == "artic_guppyplex" || name == "artic_minion")
  }
  !skip
' local_tools.yml > tools.filtered.yml
mv tools.filtered.yml local_tools.yml