# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

USBMODULES:=drivers/usb/common/usb-common drivers/usb/core/usbcore
USBUDC:=gadget/udc
NF_NAT_MASQ:=net/ipv4/netfilter/nf_nat_ipv4 net/ipv4/netfilter/nf_nat_masquerade_ipv4
NF_REJECT:=net/ipv4/netfilter/ipt_REJECT net/ipv4/netfilter/nf_reject_ipv4
LOCKD:=fs/nfs_common/grace fs/lockd/lockd
