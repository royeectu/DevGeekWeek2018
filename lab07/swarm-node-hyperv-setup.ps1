# Swarm mode using Docker Machine

$managers=3
$workers=2

# Change the SwitchName to the name of your virtual switch
$SwitchName = "Swarm Switch"

# create manager machines
echo "======> Creating manager machines ..."
for ($node=1;$node -le $managers;$node++) {
	echo "======> Creating manager$node machine ..."
	docker-machine create -d hyperv --hyperv-virtual-switch $SwitchName ('manager'+$node)
}

# create worker machines
echo "======> Creating worker machines ..."
for ($node=1;$node -le $workers;$node++) {
	echo "======> Creating worker$node machine ..."
	docker-machine create -d hyperv --hyperv-virtual-switch $SwitchName ('worker'+$node)
}

# list all machines
docker-machine ls