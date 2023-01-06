wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

qm create 8000 --memory 2048 --core 2 --name ubuntu-cloud --net0 virtio,bridge=vmbr0

qm importdisk 8000 focal-server-cloudimg-amd64.img local-zfs

qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-8000-disk-0

qm set 8000 --ide2 local-zfs:cloudinit

qm set 8000 --boot c --bootdisk scsi0

qm set 8000 --serial0 socket --vga serial0

qm template 8000
