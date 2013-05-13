#include <linux/kernel.h>

asmlinkage long sys_sup(void){

   printk(KERN_EMERG "Sup world, go warriors");

   return 0;

}
