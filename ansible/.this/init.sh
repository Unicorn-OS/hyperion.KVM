inventory="test"
this=ansible/.this

copy_template(){
  cp $inventory/inventory/hosts.template $inventory/inventory/hosts
}

set_user(){
  sed -i "s/ansible_user=me/ansible_user=$USER/" $inventory/inventory/hosts
}

link_template(){
  ln -srf ansible.cfg ..
  ln -srf uni ..
}

checkLocation(){
  SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
  # echo $SCRIPTPATH
  dirname $SCRIPTPATH
  cd $SCRIPTPATH
}


main(){
  checkLocation
  copy_template
  set_user
  link_template
}

main
