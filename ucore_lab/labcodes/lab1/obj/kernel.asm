
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 6b 2c 00 00       	call   102c8f <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 1d 15 00 00       	call   101549 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 40 34 10 00 	movl   $0x103440,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 5c 34 10 00       	push   $0x10345c
  10003e:	e8 fa 01 00 00       	call   10023d <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 91 08 00 00       	call   1008dc <print_kerninfo>

    grade_backtrace();
  10004b:	e8 74 00 00 00       	call   1000c4 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 fe 28 00 00       	call   102953 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 32 16 00 00       	call   10168c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 b4 17 00 00       	call   101813 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 ca 0c 00 00       	call   100d2e <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 60 17 00 00       	call   1017c9 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100069:	eb fe                	jmp    100069 <kern_init+0x69>

0010006b <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006b:	55                   	push   %ebp
  10006c:	89 e5                	mov    %esp,%ebp
  10006e:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100071:	83 ec 04             	sub    $0x4,%esp
  100074:	6a 00                	push   $0x0
  100076:	6a 00                	push   $0x0
  100078:	6a 00                	push   $0x0
  10007a:	e8 9d 0c 00 00       	call   100d1c <mon_backtrace>
  10007f:	83 c4 10             	add    $0x10,%esp
}
  100082:	90                   	nop
  100083:	c9                   	leave  
  100084:	c3                   	ret    

00100085 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100085:	55                   	push   %ebp
  100086:	89 e5                	mov    %esp,%ebp
  100088:	53                   	push   %ebx
  100089:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10008f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100092:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100095:	8b 45 08             	mov    0x8(%ebp),%eax
  100098:	51                   	push   %ecx
  100099:	52                   	push   %edx
  10009a:	53                   	push   %ebx
  10009b:	50                   	push   %eax
  10009c:	e8 ca ff ff ff       	call   10006b <grade_backtrace2>
  1000a1:	83 c4 10             	add    $0x10,%esp
}
  1000a4:	90                   	nop
  1000a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a8:	c9                   	leave  
  1000a9:	c3                   	ret    

001000aa <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000aa:	55                   	push   %ebp
  1000ab:	89 e5                	mov    %esp,%ebp
  1000ad:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b0:	83 ec 08             	sub    $0x8,%esp
  1000b3:	ff 75 10             	pushl  0x10(%ebp)
  1000b6:	ff 75 08             	pushl  0x8(%ebp)
  1000b9:	e8 c7 ff ff ff       	call   100085 <grade_backtrace1>
  1000be:	83 c4 10             	add    $0x10,%esp
}
  1000c1:	90                   	nop
  1000c2:	c9                   	leave  
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ca:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cf:	83 ec 04             	sub    $0x4,%esp
  1000d2:	68 00 00 ff ff       	push   $0xffff0000
  1000d7:	50                   	push   %eax
  1000d8:	6a 00                	push   $0x0
  1000da:	e8 cb ff ff ff       	call   1000aa <grade_backtrace0>
  1000df:	83 c4 10             	add    $0x10,%esp
}
  1000e2:	90                   	nop
  1000e3:	c9                   	leave  
  1000e4:	c3                   	ret    

001000e5 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e5:	55                   	push   %ebp
  1000e6:	89 e5                	mov    %esp,%ebp
  1000e8:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000eb:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ee:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f1:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f4:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fb:	0f b7 c0             	movzwl %ax,%eax
  1000fe:	83 e0 03             	and    $0x3,%eax
  100101:	89 c2                	mov    %eax,%edx
  100103:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100108:	83 ec 04             	sub    $0x4,%esp
  10010b:	52                   	push   %edx
  10010c:	50                   	push   %eax
  10010d:	68 61 34 10 00       	push   $0x103461
  100112:	e8 26 01 00 00       	call   10023d <cprintf>
  100117:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011e:	0f b7 d0             	movzwl %ax,%edx
  100121:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100126:	83 ec 04             	sub    $0x4,%esp
  100129:	52                   	push   %edx
  10012a:	50                   	push   %eax
  10012b:	68 6f 34 10 00       	push   $0x10346f
  100130:	e8 08 01 00 00       	call   10023d <cprintf>
  100135:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100138:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013c:	0f b7 d0             	movzwl %ax,%edx
  10013f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	52                   	push   %edx
  100148:	50                   	push   %eax
  100149:	68 7d 34 10 00       	push   $0x10347d
  10014e:	e8 ea 00 00 00       	call   10023d <cprintf>
  100153:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100156:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015a:	0f b7 d0             	movzwl %ax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	83 ec 04             	sub    $0x4,%esp
  100165:	52                   	push   %edx
  100166:	50                   	push   %eax
  100167:	68 8b 34 10 00       	push   $0x10348b
  10016c:	e8 cc 00 00 00       	call   10023d <cprintf>
  100171:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100174:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100178:	0f b7 d0             	movzwl %ax,%edx
  10017b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100180:	83 ec 04             	sub    $0x4,%esp
  100183:	52                   	push   %edx
  100184:	50                   	push   %eax
  100185:	68 99 34 10 00       	push   $0x103499
  10018a:	e8 ae 00 00 00       	call   10023d <cprintf>
  10018f:	83 c4 10             	add    $0x10,%esp
    round ++;
  100192:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100197:	83 c0 01             	add    $0x1,%eax
  10019a:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  10019f:	90                   	nop
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001a5:	90                   	nop
  1001a6:	5d                   	pop    %ebp
  1001a7:	c3                   	ret    

001001a8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001a8:	55                   	push   %ebp
  1001a9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ab:	90                   	nop
  1001ac:	5d                   	pop    %ebp
  1001ad:	c3                   	ret    

001001ae <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ae:	55                   	push   %ebp
  1001af:	89 e5                	mov    %esp,%ebp
  1001b1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001b4:	e8 2c ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001b9:	83 ec 0c             	sub    $0xc,%esp
  1001bc:	68 a8 34 10 00       	push   $0x1034a8
  1001c1:	e8 77 00 00 00       	call   10023d <cprintf>
  1001c6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c9:	e8 d4 ff ff ff       	call   1001a2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ce:	e8 12 ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d3:	83 ec 0c             	sub    $0xc,%esp
  1001d6:	68 c8 34 10 00       	push   $0x1034c8
  1001db:	e8 5d 00 00 00       	call   10023d <cprintf>
  1001e0:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001e3:	e8 c0 ff ff ff       	call   1001a8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e8:	e8 f8 fe ff ff       	call   1000e5 <lab1_print_cur_status>
}
  1001ed:	90                   	nop
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    

001001f0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001f6:	83 ec 0c             	sub    $0xc,%esp
  1001f9:	ff 75 08             	pushl  0x8(%ebp)
  1001fc:	e8 79 13 00 00       	call   10157a <cons_putc>
  100201:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100204:	8b 45 0c             	mov    0xc(%ebp),%eax
  100207:	8b 00                	mov    (%eax),%eax
  100209:	8d 50 01             	lea    0x1(%eax),%edx
  10020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10020f:	89 10                	mov    %edx,(%eax)
}
  100211:	90                   	nop
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10021a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100221:	ff 75 0c             	pushl  0xc(%ebp)
  100224:	ff 75 08             	pushl  0x8(%ebp)
  100227:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10022a:	50                   	push   %eax
  10022b:	68 f0 01 10 00       	push   $0x1001f0
  100230:	e8 90 2d 00 00       	call   102fc5 <vprintfmt>
  100235:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100238:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10023b:	c9                   	leave  
  10023c:	c3                   	ret    

0010023d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10023d:	55                   	push   %ebp
  10023e:	89 e5                	mov    %esp,%ebp
  100240:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100243:	8d 45 0c             	lea    0xc(%ebp),%eax
  100246:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100249:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10024c:	83 ec 08             	sub    $0x8,%esp
  10024f:	50                   	push   %eax
  100250:	ff 75 08             	pushl  0x8(%ebp)
  100253:	e8 bc ff ff ff       	call   100214 <vcprintf>
  100258:	83 c4 10             	add    $0x10,%esp
  10025b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100261:	c9                   	leave  
  100262:	c3                   	ret    

00100263 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100263:	55                   	push   %ebp
  100264:	89 e5                	mov    %esp,%ebp
  100266:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100269:	83 ec 0c             	sub    $0xc,%esp
  10026c:	ff 75 08             	pushl  0x8(%ebp)
  10026f:	e8 06 13 00 00       	call   10157a <cons_putc>
  100274:	83 c4 10             	add    $0x10,%esp
}
  100277:	90                   	nop
  100278:	c9                   	leave  
  100279:	c3                   	ret    

0010027a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10027a:	55                   	push   %ebp
  10027b:	89 e5                	mov    %esp,%ebp
  10027d:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100280:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100287:	eb 14                	jmp    10029d <cputs+0x23>
        cputch(c, &cnt);
  100289:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10028d:	83 ec 08             	sub    $0x8,%esp
  100290:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100293:	52                   	push   %edx
  100294:	50                   	push   %eax
  100295:	e8 56 ff ff ff       	call   1001f0 <cputch>
  10029a:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10029d:	8b 45 08             	mov    0x8(%ebp),%eax
  1002a0:	8d 50 01             	lea    0x1(%eax),%edx
  1002a3:	89 55 08             	mov    %edx,0x8(%ebp)
  1002a6:	0f b6 00             	movzbl (%eax),%eax
  1002a9:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002ac:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002b0:	75 d7                	jne    100289 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002b2:	83 ec 08             	sub    $0x8,%esp
  1002b5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002b8:	50                   	push   %eax
  1002b9:	6a 0a                	push   $0xa
  1002bb:	e8 30 ff ff ff       	call   1001f0 <cputch>
  1002c0:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002c6:	c9                   	leave  
  1002c7:	c3                   	ret    

001002c8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002ce:	e8 d7 12 00 00       	call   1015aa <cons_getc>
  1002d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002da:	74 f2                	je     1002ce <getchar+0x6>
        /* do nothing */;
    return c;
  1002dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002eb:	74 13                	je     100300 <readline+0x1f>
        cprintf("%s", prompt);
  1002ed:	83 ec 08             	sub    $0x8,%esp
  1002f0:	ff 75 08             	pushl  0x8(%ebp)
  1002f3:	68 e7 34 10 00       	push   $0x1034e7
  1002f8:	e8 40 ff ff ff       	call   10023d <cprintf>
  1002fd:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100307:	e8 bc ff ff ff       	call   1002c8 <getchar>
  10030c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10030f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100313:	79 0a                	jns    10031f <readline+0x3e>
            return NULL;
  100315:	b8 00 00 00 00       	mov    $0x0,%eax
  10031a:	e9 82 00 00 00       	jmp    1003a1 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10031f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100323:	7e 2b                	jle    100350 <readline+0x6f>
  100325:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10032c:	7f 22                	jg     100350 <readline+0x6f>
            cputchar(c);
  10032e:	83 ec 0c             	sub    $0xc,%esp
  100331:	ff 75 f0             	pushl  -0x10(%ebp)
  100334:	e8 2a ff ff ff       	call   100263 <cputchar>
  100339:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10033c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10033f:	8d 50 01             	lea    0x1(%eax),%edx
  100342:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100345:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100348:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10034e:	eb 4c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100350:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100354:	75 1a                	jne    100370 <readline+0x8f>
  100356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10035a:	7e 14                	jle    100370 <readline+0x8f>
            cputchar(c);
  10035c:	83 ec 0c             	sub    $0xc,%esp
  10035f:	ff 75 f0             	pushl  -0x10(%ebp)
  100362:	e8 fc fe ff ff       	call   100263 <cputchar>
  100367:	83 c4 10             	add    $0x10,%esp
            i --;
  10036a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10036e:	eb 2c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100370:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100374:	74 06                	je     10037c <readline+0x9b>
  100376:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10037a:	75 8b                	jne    100307 <readline+0x26>
            cputchar(c);
  10037c:	83 ec 0c             	sub    $0xc,%esp
  10037f:	ff 75 f0             	pushl  -0x10(%ebp)
  100382:	e8 dc fe ff ff       	call   100263 <cputchar>
  100387:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10038a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10038d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100392:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100395:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10039a:	eb 05                	jmp    1003a1 <readline+0xc0>
        }
    }
  10039c:	e9 66 ff ff ff       	jmp    100307 <readline+0x26>
}
  1003a1:	c9                   	leave  
  1003a2:	c3                   	ret    

001003a3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003a3:	55                   	push   %ebp
  1003a4:	89 e5                	mov    %esp,%ebp
  1003a6:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003a9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ae:	85 c0                	test   %eax,%eax
  1003b0:	75 5f                	jne    100411 <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  1003b2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003b9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003bc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003c2:	83 ec 04             	sub    $0x4,%esp
  1003c5:	ff 75 0c             	pushl  0xc(%ebp)
  1003c8:	ff 75 08             	pushl  0x8(%ebp)
  1003cb:	68 ea 34 10 00       	push   $0x1034ea
  1003d0:	e8 68 fe ff ff       	call   10023d <cprintf>
  1003d5:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003db:	83 ec 08             	sub    $0x8,%esp
  1003de:	50                   	push   %eax
  1003df:	ff 75 10             	pushl  0x10(%ebp)
  1003e2:	e8 2d fe ff ff       	call   100214 <vcprintf>
  1003e7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003ea:	83 ec 0c             	sub    $0xc,%esp
  1003ed:	68 06 35 10 00       	push   $0x103506
  1003f2:	e8 46 fe ff ff       	call   10023d <cprintf>
  1003f7:	83 c4 10             	add    $0x10,%esp
    
    cprintf("stack trackback:\n");
  1003fa:	83 ec 0c             	sub    $0xc,%esp
  1003fd:	68 08 35 10 00       	push   $0x103508
  100402:	e8 36 fe ff ff       	call   10023d <cprintf>
  100407:	83 c4 10             	add    $0x10,%esp
    print_stackframe();
  10040a:	e8 17 06 00 00       	call   100a26 <print_stackframe>
  10040f:	eb 01                	jmp    100412 <__panic+0x6f>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100411:	90                   	nop
    print_stackframe();
    
    va_end(ap);

panic_dead:
    intr_disable();
  100412:	e8 b9 13 00 00       	call   1017d0 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100417:	83 ec 0c             	sub    $0xc,%esp
  10041a:	6a 00                	push   $0x0
  10041c:	e8 21 08 00 00       	call   100c42 <kmonitor>
  100421:	83 c4 10             	add    $0x10,%esp
    }
  100424:	eb f1                	jmp    100417 <__panic+0x74>

00100426 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100426:	55                   	push   %ebp
  100427:	89 e5                	mov    %esp,%ebp
  100429:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  10042c:	8d 45 14             	lea    0x14(%ebp),%eax
  10042f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100432:	83 ec 04             	sub    $0x4,%esp
  100435:	ff 75 0c             	pushl  0xc(%ebp)
  100438:	ff 75 08             	pushl  0x8(%ebp)
  10043b:	68 1a 35 10 00       	push   $0x10351a
  100440:	e8 f8 fd ff ff       	call   10023d <cprintf>
  100445:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100448:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10044b:	83 ec 08             	sub    $0x8,%esp
  10044e:	50                   	push   %eax
  10044f:	ff 75 10             	pushl  0x10(%ebp)
  100452:	e8 bd fd ff ff       	call   100214 <vcprintf>
  100457:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10045a:	83 ec 0c             	sub    $0xc,%esp
  10045d:	68 06 35 10 00       	push   $0x103506
  100462:	e8 d6 fd ff ff       	call   10023d <cprintf>
  100467:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10046a:	90                   	nop
  10046b:	c9                   	leave  
  10046c:	c3                   	ret    

0010046d <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10046d:	55                   	push   %ebp
  10046e:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100470:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100475:	5d                   	pop    %ebp
  100476:	c3                   	ret    

00100477 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100477:	55                   	push   %ebp
  100478:	89 e5                	mov    %esp,%ebp
  10047a:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  10047d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100480:	8b 00                	mov    (%eax),%eax
  100482:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	8b 00                	mov    (%eax),%eax
  10048a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10048d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100494:	e9 d2 00 00 00       	jmp    10056b <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100499:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10049c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10049f:	01 d0                	add    %edx,%eax
  1004a1:	89 c2                	mov    %eax,%edx
  1004a3:	c1 ea 1f             	shr    $0x1f,%edx
  1004a6:	01 d0                	add    %edx,%eax
  1004a8:	d1 f8                	sar    %eax
  1004aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004b0:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004b3:	eb 04                	jmp    1004b9 <stab_binsearch+0x42>
            m --;
  1004b5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004bc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004bf:	7c 1f                	jl     1004e0 <stab_binsearch+0x69>
  1004c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004c4:	89 d0                	mov    %edx,%eax
  1004c6:	01 c0                	add    %eax,%eax
  1004c8:	01 d0                	add    %edx,%eax
  1004ca:	c1 e0 02             	shl    $0x2,%eax
  1004cd:	89 c2                	mov    %eax,%edx
  1004cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1004d2:	01 d0                	add    %edx,%eax
  1004d4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004d8:	0f b6 c0             	movzbl %al,%eax
  1004db:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004de:	75 d5                	jne    1004b5 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004e6:	7d 0b                	jge    1004f3 <stab_binsearch+0x7c>
            l = true_m + 1;
  1004e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004eb:	83 c0 01             	add    $0x1,%eax
  1004ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f1:	eb 78                	jmp    10056b <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004f3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004fd:	89 d0                	mov    %edx,%eax
  1004ff:	01 c0                	add    %eax,%eax
  100501:	01 d0                	add    %edx,%eax
  100503:	c1 e0 02             	shl    $0x2,%eax
  100506:	89 c2                	mov    %eax,%edx
  100508:	8b 45 08             	mov    0x8(%ebp),%eax
  10050b:	01 d0                	add    %edx,%eax
  10050d:	8b 40 08             	mov    0x8(%eax),%eax
  100510:	3b 45 18             	cmp    0x18(%ebp),%eax
  100513:	73 13                	jae    100528 <stab_binsearch+0xb1>
            *region_left = m;
  100515:	8b 45 0c             	mov    0xc(%ebp),%eax
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10051d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100520:	83 c0 01             	add    $0x1,%eax
  100523:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100526:	eb 43                	jmp    10056b <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100528:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10052b:	89 d0                	mov    %edx,%eax
  10052d:	01 c0                	add    %eax,%eax
  10052f:	01 d0                	add    %edx,%eax
  100531:	c1 e0 02             	shl    $0x2,%eax
  100534:	89 c2                	mov    %eax,%edx
  100536:	8b 45 08             	mov    0x8(%ebp),%eax
  100539:	01 d0                	add    %edx,%eax
  10053b:	8b 40 08             	mov    0x8(%eax),%eax
  10053e:	3b 45 18             	cmp    0x18(%ebp),%eax
  100541:	76 16                	jbe    100559 <stab_binsearch+0xe2>
            *region_right = m - 1;
  100543:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100546:	8d 50 ff             	lea    -0x1(%eax),%edx
  100549:	8b 45 10             	mov    0x10(%ebp),%eax
  10054c:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10054e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100551:	83 e8 01             	sub    $0x1,%eax
  100554:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100557:	eb 12                	jmp    10056b <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100559:	8b 45 0c             	mov    0xc(%ebp),%eax
  10055c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10055f:	89 10                	mov    %edx,(%eax)
            l = m;
  100561:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100564:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100567:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10056b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10056e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100571:	0f 8e 22 ff ff ff    	jle    100499 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100577:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10057b:	75 0f                	jne    10058c <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  10057d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100580:	8b 00                	mov    (%eax),%eax
  100582:	8d 50 ff             	lea    -0x1(%eax),%edx
  100585:	8b 45 10             	mov    0x10(%ebp),%eax
  100588:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10058a:	eb 3f                	jmp    1005cb <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10058c:	8b 45 10             	mov    0x10(%ebp),%eax
  10058f:	8b 00                	mov    (%eax),%eax
  100591:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100594:	eb 04                	jmp    10059a <stab_binsearch+0x123>
  100596:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  10059a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10059d:	8b 00                	mov    (%eax),%eax
  10059f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005a2:	7d 1f                	jge    1005c3 <stab_binsearch+0x14c>
  1005a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a7:	89 d0                	mov    %edx,%eax
  1005a9:	01 c0                	add    %eax,%eax
  1005ab:	01 d0                	add    %edx,%eax
  1005ad:	c1 e0 02             	shl    $0x2,%eax
  1005b0:	89 c2                	mov    %eax,%edx
  1005b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b5:	01 d0                	add    %edx,%eax
  1005b7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005bb:	0f b6 c0             	movzbl %al,%eax
  1005be:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005c1:	75 d3                	jne    100596 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005c9:	89 10                	mov    %edx,(%eax)
    }
}
  1005cb:	90                   	nop
  1005cc:	c9                   	leave  
  1005cd:	c3                   	ret    

001005ce <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005ce:	55                   	push   %ebp
  1005cf:	89 e5                	mov    %esp,%ebp
  1005d1:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d7:	c7 00 38 35 10 00    	movl   $0x103538,(%eax)
    info->eip_line = 0;
  1005dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ea:	c7 40 08 38 35 10 00 	movl   $0x103538,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f4:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fe:	8b 55 08             	mov    0x8(%ebp),%edx
  100601:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100604:	8b 45 0c             	mov    0xc(%ebp),%eax
  100607:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10060e:	c7 45 f4 8c 3d 10 00 	movl   $0x103d8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100615:	c7 45 f0 dc b6 10 00 	movl   $0x10b6dc,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10061c:	c7 45 ec dd b6 10 00 	movl   $0x10b6dd,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100623:	c7 45 e8 11 d7 10 00 	movl   $0x10d711,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10062a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10062d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100630:	76 0d                	jbe    10063f <debuginfo_eip+0x71>
  100632:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100635:	83 e8 01             	sub    $0x1,%eax
  100638:	0f b6 00             	movzbl (%eax),%eax
  10063b:	84 c0                	test   %al,%al
  10063d:	74 0a                	je     100649 <debuginfo_eip+0x7b>
        return -1;
  10063f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100644:	e9 91 02 00 00       	jmp    1008da <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100649:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100650:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100653:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100656:	29 c2                	sub    %eax,%edx
  100658:	89 d0                	mov    %edx,%eax
  10065a:	c1 f8 02             	sar    $0x2,%eax
  10065d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100663:	83 e8 01             	sub    $0x1,%eax
  100666:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100669:	ff 75 08             	pushl  0x8(%ebp)
  10066c:	6a 64                	push   $0x64
  10066e:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100671:	50                   	push   %eax
  100672:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100675:	50                   	push   %eax
  100676:	ff 75 f4             	pushl  -0xc(%ebp)
  100679:	e8 f9 fd ff ff       	call   100477 <stab_binsearch>
  10067e:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  100681:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100684:	85 c0                	test   %eax,%eax
  100686:	75 0a                	jne    100692 <debuginfo_eip+0xc4>
        return -1;
  100688:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10068d:	e9 48 02 00 00       	jmp    1008da <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  100692:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100695:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100698:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10069b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10069e:	ff 75 08             	pushl  0x8(%ebp)
  1006a1:	6a 24                	push   $0x24
  1006a3:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006a6:	50                   	push   %eax
  1006a7:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006aa:	50                   	push   %eax
  1006ab:	ff 75 f4             	pushl  -0xc(%ebp)
  1006ae:	e8 c4 fd ff ff       	call   100477 <stab_binsearch>
  1006b3:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006b6:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006bc:	39 c2                	cmp    %eax,%edx
  1006be:	7f 7c                	jg     10073c <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006c3:	89 c2                	mov    %eax,%edx
  1006c5:	89 d0                	mov    %edx,%eax
  1006c7:	01 c0                	add    %eax,%eax
  1006c9:	01 d0                	add    %edx,%eax
  1006cb:	c1 e0 02             	shl    $0x2,%eax
  1006ce:	89 c2                	mov    %eax,%edx
  1006d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d3:	01 d0                	add    %edx,%eax
  1006d5:	8b 00                	mov    (%eax),%eax
  1006d7:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006da:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006dd:	29 d1                	sub    %edx,%ecx
  1006df:	89 ca                	mov    %ecx,%edx
  1006e1:	39 d0                	cmp    %edx,%eax
  1006e3:	73 22                	jae    100707 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006e8:	89 c2                	mov    %eax,%edx
  1006ea:	89 d0                	mov    %edx,%eax
  1006ec:	01 c0                	add    %eax,%eax
  1006ee:	01 d0                	add    %edx,%eax
  1006f0:	c1 e0 02             	shl    $0x2,%eax
  1006f3:	89 c2                	mov    %eax,%edx
  1006f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f8:	01 d0                	add    %edx,%eax
  1006fa:	8b 10                	mov    (%eax),%edx
  1006fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006ff:	01 c2                	add    %eax,%edx
  100701:	8b 45 0c             	mov    0xc(%ebp),%eax
  100704:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100707:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10070a:	89 c2                	mov    %eax,%edx
  10070c:	89 d0                	mov    %edx,%eax
  10070e:	01 c0                	add    %eax,%eax
  100710:	01 d0                	add    %edx,%eax
  100712:	c1 e0 02             	shl    $0x2,%eax
  100715:	89 c2                	mov    %eax,%edx
  100717:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071a:	01 d0                	add    %edx,%eax
  10071c:	8b 50 08             	mov    0x8(%eax),%edx
  10071f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100722:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100725:	8b 45 0c             	mov    0xc(%ebp),%eax
  100728:	8b 40 10             	mov    0x10(%eax),%eax
  10072b:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10072e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100731:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100734:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100737:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10073a:	eb 15                	jmp    100751 <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10073c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073f:	8b 55 08             	mov    0x8(%ebp),%edx
  100742:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100748:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10074b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10074e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100751:	8b 45 0c             	mov    0xc(%ebp),%eax
  100754:	8b 40 08             	mov    0x8(%eax),%eax
  100757:	83 ec 08             	sub    $0x8,%esp
  10075a:	6a 3a                	push   $0x3a
  10075c:	50                   	push   %eax
  10075d:	e8 a1 23 00 00       	call   102b03 <strfind>
  100762:	83 c4 10             	add    $0x10,%esp
  100765:	89 c2                	mov    %eax,%edx
  100767:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076a:	8b 40 08             	mov    0x8(%eax),%eax
  10076d:	29 c2                	sub    %eax,%edx
  10076f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100772:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100775:	83 ec 0c             	sub    $0xc,%esp
  100778:	ff 75 08             	pushl  0x8(%ebp)
  10077b:	6a 44                	push   $0x44
  10077d:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100780:	50                   	push   %eax
  100781:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100784:	50                   	push   %eax
  100785:	ff 75 f4             	pushl  -0xc(%ebp)
  100788:	e8 ea fc ff ff       	call   100477 <stab_binsearch>
  10078d:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  100790:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100793:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100796:	39 c2                	cmp    %eax,%edx
  100798:	7f 24                	jg     1007be <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  10079a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10079d:	89 c2                	mov    %eax,%edx
  10079f:	89 d0                	mov    %edx,%eax
  1007a1:	01 c0                	add    %eax,%eax
  1007a3:	01 d0                	add    %edx,%eax
  1007a5:	c1 e0 02             	shl    $0x2,%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ad:	01 d0                	add    %edx,%eax
  1007af:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007b3:	0f b7 d0             	movzwl %ax,%edx
  1007b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b9:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007bc:	eb 13                	jmp    1007d1 <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c3:	e9 12 01 00 00       	jmp    1008da <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cb:	83 e8 01             	sub    $0x1,%eax
  1007ce:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007d1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007d7:	39 c2                	cmp    %eax,%edx
  1007d9:	7c 56                	jl     100831 <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007de:	89 c2                	mov    %eax,%edx
  1007e0:	89 d0                	mov    %edx,%eax
  1007e2:	01 c0                	add    %eax,%eax
  1007e4:	01 d0                	add    %edx,%eax
  1007e6:	c1 e0 02             	shl    $0x2,%eax
  1007e9:	89 c2                	mov    %eax,%edx
  1007eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ee:	01 d0                	add    %edx,%eax
  1007f0:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007f4:	3c 84                	cmp    $0x84,%al
  1007f6:	74 39                	je     100831 <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007fb:	89 c2                	mov    %eax,%edx
  1007fd:	89 d0                	mov    %edx,%eax
  1007ff:	01 c0                	add    %eax,%eax
  100801:	01 d0                	add    %edx,%eax
  100803:	c1 e0 02             	shl    $0x2,%eax
  100806:	89 c2                	mov    %eax,%edx
  100808:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080b:	01 d0                	add    %edx,%eax
  10080d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100811:	3c 64                	cmp    $0x64,%al
  100813:	75 b3                	jne    1007c8 <debuginfo_eip+0x1fa>
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	89 c2                	mov    %eax,%edx
  10081a:	89 d0                	mov    %edx,%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	01 d0                	add    %edx,%eax
  100820:	c1 e0 02             	shl    $0x2,%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	8b 40 08             	mov    0x8(%eax),%eax
  10082d:	85 c0                	test   %eax,%eax
  10082f:	74 97                	je     1007c8 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100831:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100834:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100837:	39 c2                	cmp    %eax,%edx
  100839:	7c 46                	jl     100881 <debuginfo_eip+0x2b3>
  10083b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10083e:	89 c2                	mov    %eax,%edx
  100840:	89 d0                	mov    %edx,%eax
  100842:	01 c0                	add    %eax,%eax
  100844:	01 d0                	add    %edx,%eax
  100846:	c1 e0 02             	shl    $0x2,%eax
  100849:	89 c2                	mov    %eax,%edx
  10084b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10084e:	01 d0                	add    %edx,%eax
  100850:	8b 00                	mov    (%eax),%eax
  100852:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100855:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100858:	29 d1                	sub    %edx,%ecx
  10085a:	89 ca                	mov    %ecx,%edx
  10085c:	39 d0                	cmp    %edx,%eax
  10085e:	73 21                	jae    100881 <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100860:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100863:	89 c2                	mov    %eax,%edx
  100865:	89 d0                	mov    %edx,%eax
  100867:	01 c0                	add    %eax,%eax
  100869:	01 d0                	add    %edx,%eax
  10086b:	c1 e0 02             	shl    $0x2,%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100873:	01 d0                	add    %edx,%eax
  100875:	8b 10                	mov    (%eax),%edx
  100877:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10087a:	01 c2                	add    %eax,%edx
  10087c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10087f:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100881:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100884:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100887:	39 c2                	cmp    %eax,%edx
  100889:	7d 4a                	jge    1008d5 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  10088b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10088e:	83 c0 01             	add    $0x1,%eax
  100891:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100894:	eb 18                	jmp    1008ae <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100896:	8b 45 0c             	mov    0xc(%ebp),%eax
  100899:	8b 40 14             	mov    0x14(%eax),%eax
  10089c:	8d 50 01             	lea    0x1(%eax),%edx
  10089f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a2:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1008a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a8:	83 c0 01             	add    $0x1,%eax
  1008ab:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008b4:	39 c2                	cmp    %eax,%edx
  1008b6:	7d 1d                	jge    1008d5 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008bb:	89 c2                	mov    %eax,%edx
  1008bd:	89 d0                	mov    %edx,%eax
  1008bf:	01 c0                	add    %eax,%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	c1 e0 02             	shl    $0x2,%eax
  1008c6:	89 c2                	mov    %eax,%edx
  1008c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008cb:	01 d0                	add    %edx,%eax
  1008cd:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008d1:	3c a0                	cmp    $0xa0,%al
  1008d3:	74 c1                	je     100896 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008d5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008e2:	83 ec 0c             	sub    $0xc,%esp
  1008e5:	68 42 35 10 00       	push   $0x103542
  1008ea:	e8 4e f9 ff ff       	call   10023d <cprintf>
  1008ef:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008f2:	83 ec 08             	sub    $0x8,%esp
  1008f5:	68 00 00 10 00       	push   $0x100000
  1008fa:	68 5b 35 10 00       	push   $0x10355b
  1008ff:	e8 39 f9 ff ff       	call   10023d <cprintf>
  100904:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100907:	83 ec 08             	sub    $0x8,%esp
  10090a:	68 26 34 10 00       	push   $0x103426
  10090f:	68 73 35 10 00       	push   $0x103573
  100914:	e8 24 f9 ff ff       	call   10023d <cprintf>
  100919:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  10091c:	83 ec 08             	sub    $0x8,%esp
  10091f:	68 16 ea 10 00       	push   $0x10ea16
  100924:	68 8b 35 10 00       	push   $0x10358b
  100929:	e8 0f f9 ff ff       	call   10023d <cprintf>
  10092e:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100931:	83 ec 08             	sub    $0x8,%esp
  100934:	68 20 fd 10 00       	push   $0x10fd20
  100939:	68 a3 35 10 00       	push   $0x1035a3
  10093e:	e8 fa f8 ff ff       	call   10023d <cprintf>
  100943:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100946:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  10094b:	05 ff 03 00 00       	add    $0x3ff,%eax
  100950:	ba 00 00 10 00       	mov    $0x100000,%edx
  100955:	29 d0                	sub    %edx,%eax
  100957:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10095d:	85 c0                	test   %eax,%eax
  10095f:	0f 48 c2             	cmovs  %edx,%eax
  100962:	c1 f8 0a             	sar    $0xa,%eax
  100965:	83 ec 08             	sub    $0x8,%esp
  100968:	50                   	push   %eax
  100969:	68 bc 35 10 00       	push   $0x1035bc
  10096e:	e8 ca f8 ff ff       	call   10023d <cprintf>
  100973:	83 c4 10             	add    $0x10,%esp
}
  100976:	90                   	nop
  100977:	c9                   	leave  
  100978:	c3                   	ret    

00100979 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100979:	55                   	push   %ebp
  10097a:	89 e5                	mov    %esp,%ebp
  10097c:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100982:	83 ec 08             	sub    $0x8,%esp
  100985:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100988:	50                   	push   %eax
  100989:	ff 75 08             	pushl  0x8(%ebp)
  10098c:	e8 3d fc ff ff       	call   1005ce <debuginfo_eip>
  100991:	83 c4 10             	add    $0x10,%esp
  100994:	85 c0                	test   %eax,%eax
  100996:	74 15                	je     1009ad <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100998:	83 ec 08             	sub    $0x8,%esp
  10099b:	ff 75 08             	pushl  0x8(%ebp)
  10099e:	68 e6 35 10 00       	push   $0x1035e6
  1009a3:	e8 95 f8 ff ff       	call   10023d <cprintf>
  1009a8:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009ab:	eb 65                	jmp    100a12 <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009b4:	eb 1c                	jmp    1009d2 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bc:	01 d0                	add    %edx,%eax
  1009be:	0f b6 00             	movzbl (%eax),%eax
  1009c1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009ca:	01 ca                	add    %ecx,%edx
  1009cc:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009d5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009d8:	7f dc                	jg     1009b6 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009da:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e3:	01 d0                	add    %edx,%eax
  1009e5:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009eb:	8b 55 08             	mov    0x8(%ebp),%edx
  1009ee:	89 d1                	mov    %edx,%ecx
  1009f0:	29 c1                	sub    %eax,%ecx
  1009f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009f8:	83 ec 0c             	sub    $0xc,%esp
  1009fb:	51                   	push   %ecx
  1009fc:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a02:	51                   	push   %ecx
  100a03:	52                   	push   %edx
  100a04:	50                   	push   %eax
  100a05:	68 02 36 10 00       	push   $0x103602
  100a0a:	e8 2e f8 ff ff       	call   10023d <cprintf>
  100a0f:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  100a12:	90                   	nop
  100a13:	c9                   	leave  
  100a14:	c3                   	ret    

00100a15 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a15:	55                   	push   %ebp
  100a16:	89 e5                	mov    %esp,%ebp
  100a18:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a1b:	8b 45 04             	mov    0x4(%ebp),%eax
  100a1e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a21:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a24:	c9                   	leave  
  100a25:	c3                   	ret    

00100a26 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a26:	55                   	push   %ebp
  100a27:	89 e5                	mov    %esp,%ebp
  100a29:	53                   	push   %ebx
  100a2a:	83 ec 24             	sub    $0x24,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a2d:	89 e8                	mov    %ebp,%eax
  100a2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  100a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
  100a35:	89 45 f4             	mov    %eax,-0xc(%ebp)
	uint32_t eip = read_eip();
  100a38:	e8 d8 ff ff ff       	call   100a15 <read_eip>
  100a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i = 0;
  100a40:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while(ebp != 0 && i < STACKFRAME_DEPTH) {
  100a47:	eb 77                	jmp    100ac0 <print_stackframe+0x9a>
		cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
  100a49:	83 ec 04             	sub    $0x4,%esp
  100a4c:	ff 75 f0             	pushl  -0x10(%ebp)
  100a4f:	ff 75 f4             	pushl  -0xc(%ebp)
  100a52:	68 14 36 10 00       	push   $0x103614
  100a57:	e8 e1 f7 ff ff       	call   10023d <cprintf>
  100a5c:	83 c4 10             	add    $0x10,%esp
		uint32_t *base = (uint32_t *)ebp;
  100a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a62:	89 45 e8             	mov    %eax,-0x18(%ebp)
		cprintf("args: 0x%08x 0x%08x 0x%08x 0x%08x\n", base[2], base[3], base[4], base[5]);
  100a65:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a68:	83 c0 14             	add    $0x14,%eax
  100a6b:	8b 18                	mov    (%eax),%ebx
  100a6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a70:	83 c0 10             	add    $0x10,%eax
  100a73:	8b 08                	mov    (%eax),%ecx
  100a75:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a78:	83 c0 0c             	add    $0xc,%eax
  100a7b:	8b 10                	mov    (%eax),%edx
  100a7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a80:	83 c0 08             	add    $0x8,%eax
  100a83:	8b 00                	mov    (%eax),%eax
  100a85:	83 ec 0c             	sub    $0xc,%esp
  100a88:	53                   	push   %ebx
  100a89:	51                   	push   %ecx
  100a8a:	52                   	push   %edx
  100a8b:	50                   	push   %eax
  100a8c:	68 2c 36 10 00       	push   $0x10362c
  100a91:	e8 a7 f7 ff ff       	call   10023d <cprintf>
  100a96:	83 c4 20             	add    $0x20,%esp
		print_debuginfo(eip - 1);
  100a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a9c:	83 e8 01             	sub    $0x1,%eax
  100a9f:	83 ec 0c             	sub    $0xc,%esp
  100aa2:	50                   	push   %eax
  100aa3:	e8 d1 fe ff ff       	call   100979 <print_debuginfo>
  100aa8:	83 c4 10             	add    $0x10,%esp
		eip = base[1];
  100aab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100aae:	8b 40 04             	mov    0x4(%eax),%eax
  100ab1:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = base[0];
  100ab4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab7:	8b 00                	mov    (%eax),%eax
  100ab9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        i++;
  100abc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
	uint32_t eip = read_eip();
	int i = 0;
	while(ebp != 0 && i < STACKFRAME_DEPTH) {
  100ac0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ac4:	74 0a                	je     100ad0 <print_stackframe+0xaa>
  100ac6:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100aca:	0f 8e 79 ff ff ff    	jle    100a49 <print_stackframe+0x23>
		print_debuginfo(eip - 1);
		eip = base[1];
        ebp = base[0];
        i++;
	}
}
  100ad0:	90                   	nop
  100ad1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ad4:	c9                   	leave  
  100ad5:	c3                   	ret    

00100ad6 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ad6:	55                   	push   %ebp
  100ad7:	89 e5                	mov    %esp,%ebp
  100ad9:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100adc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ae3:	eb 0c                	jmp    100af1 <parse+0x1b>
            *buf ++ = '\0';
  100ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae8:	8d 50 01             	lea    0x1(%eax),%edx
  100aeb:	89 55 08             	mov    %edx,0x8(%ebp)
  100aee:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af1:	8b 45 08             	mov    0x8(%ebp),%eax
  100af4:	0f b6 00             	movzbl (%eax),%eax
  100af7:	84 c0                	test   %al,%al
  100af9:	74 1e                	je     100b19 <parse+0x43>
  100afb:	8b 45 08             	mov    0x8(%ebp),%eax
  100afe:	0f b6 00             	movzbl (%eax),%eax
  100b01:	0f be c0             	movsbl %al,%eax
  100b04:	83 ec 08             	sub    $0x8,%esp
  100b07:	50                   	push   %eax
  100b08:	68 d0 36 10 00       	push   $0x1036d0
  100b0d:	e8 be 1f 00 00       	call   102ad0 <strchr>
  100b12:	83 c4 10             	add    $0x10,%esp
  100b15:	85 c0                	test   %eax,%eax
  100b17:	75 cc                	jne    100ae5 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b19:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1c:	0f b6 00             	movzbl (%eax),%eax
  100b1f:	84 c0                	test   %al,%al
  100b21:	74 69                	je     100b8c <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b23:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b27:	75 12                	jne    100b3b <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b29:	83 ec 08             	sub    $0x8,%esp
  100b2c:	6a 10                	push   $0x10
  100b2e:	68 d5 36 10 00       	push   $0x1036d5
  100b33:	e8 05 f7 ff ff       	call   10023d <cprintf>
  100b38:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3e:	8d 50 01             	lea    0x1(%eax),%edx
  100b41:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b44:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b4e:	01 c2                	add    %eax,%edx
  100b50:	8b 45 08             	mov    0x8(%ebp),%eax
  100b53:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b55:	eb 04                	jmp    100b5b <parse+0x85>
            buf ++;
  100b57:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b5b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5e:	0f b6 00             	movzbl (%eax),%eax
  100b61:	84 c0                	test   %al,%al
  100b63:	0f 84 7a ff ff ff    	je     100ae3 <parse+0xd>
  100b69:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6c:	0f b6 00             	movzbl (%eax),%eax
  100b6f:	0f be c0             	movsbl %al,%eax
  100b72:	83 ec 08             	sub    $0x8,%esp
  100b75:	50                   	push   %eax
  100b76:	68 d0 36 10 00       	push   $0x1036d0
  100b7b:	e8 50 1f 00 00       	call   102ad0 <strchr>
  100b80:	83 c4 10             	add    $0x10,%esp
  100b83:	85 c0                	test   %eax,%eax
  100b85:	74 d0                	je     100b57 <parse+0x81>
            buf ++;
        }
    }
  100b87:	e9 57 ff ff ff       	jmp    100ae3 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b8c:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b90:	c9                   	leave  
  100b91:	c3                   	ret    

00100b92 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b92:	55                   	push   %ebp
  100b93:	89 e5                	mov    %esp,%ebp
  100b95:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b98:	83 ec 08             	sub    $0x8,%esp
  100b9b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b9e:	50                   	push   %eax
  100b9f:	ff 75 08             	pushl  0x8(%ebp)
  100ba2:	e8 2f ff ff ff       	call   100ad6 <parse>
  100ba7:	83 c4 10             	add    $0x10,%esp
  100baa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bb1:	75 0a                	jne    100bbd <runcmd+0x2b>
        return 0;
  100bb3:	b8 00 00 00 00       	mov    $0x0,%eax
  100bb8:	e9 83 00 00 00       	jmp    100c40 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bc4:	eb 59                	jmp    100c1f <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bc6:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bcc:	89 d0                	mov    %edx,%eax
  100bce:	01 c0                	add    %eax,%eax
  100bd0:	01 d0                	add    %edx,%eax
  100bd2:	c1 e0 02             	shl    $0x2,%eax
  100bd5:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bda:	8b 00                	mov    (%eax),%eax
  100bdc:	83 ec 08             	sub    $0x8,%esp
  100bdf:	51                   	push   %ecx
  100be0:	50                   	push   %eax
  100be1:	e8 4a 1e 00 00       	call   102a30 <strcmp>
  100be6:	83 c4 10             	add    $0x10,%esp
  100be9:	85 c0                	test   %eax,%eax
  100beb:	75 2e                	jne    100c1b <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100bed:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf0:	89 d0                	mov    %edx,%eax
  100bf2:	01 c0                	add    %eax,%eax
  100bf4:	01 d0                	add    %edx,%eax
  100bf6:	c1 e0 02             	shl    $0x2,%eax
  100bf9:	05 08 e0 10 00       	add    $0x10e008,%eax
  100bfe:	8b 10                	mov    (%eax),%edx
  100c00:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c03:	83 c0 04             	add    $0x4,%eax
  100c06:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c09:	83 e9 01             	sub    $0x1,%ecx
  100c0c:	83 ec 04             	sub    $0x4,%esp
  100c0f:	ff 75 0c             	pushl  0xc(%ebp)
  100c12:	50                   	push   %eax
  100c13:	51                   	push   %ecx
  100c14:	ff d2                	call   *%edx
  100c16:	83 c4 10             	add    $0x10,%esp
  100c19:	eb 25                	jmp    100c40 <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c22:	83 f8 02             	cmp    $0x2,%eax
  100c25:	76 9f                	jbe    100bc6 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c27:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c2a:	83 ec 08             	sub    $0x8,%esp
  100c2d:	50                   	push   %eax
  100c2e:	68 f3 36 10 00       	push   $0x1036f3
  100c33:	e8 05 f6 ff ff       	call   10023d <cprintf>
  100c38:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c3b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c40:	c9                   	leave  
  100c41:	c3                   	ret    

00100c42 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c42:	55                   	push   %ebp
  100c43:	89 e5                	mov    %esp,%ebp
  100c45:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c48:	83 ec 0c             	sub    $0xc,%esp
  100c4b:	68 0c 37 10 00       	push   $0x10370c
  100c50:	e8 e8 f5 ff ff       	call   10023d <cprintf>
  100c55:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c58:	83 ec 0c             	sub    $0xc,%esp
  100c5b:	68 34 37 10 00       	push   $0x103734
  100c60:	e8 d8 f5 ff ff       	call   10023d <cprintf>
  100c65:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c68:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c6c:	74 0e                	je     100c7c <kmonitor+0x3a>
        print_trapframe(tf);
  100c6e:	83 ec 0c             	sub    $0xc,%esp
  100c71:	ff 75 08             	pushl  0x8(%ebp)
  100c74:	e8 53 0d 00 00       	call   1019cc <print_trapframe>
  100c79:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c7c:	83 ec 0c             	sub    $0xc,%esp
  100c7f:	68 59 37 10 00       	push   $0x103759
  100c84:	e8 58 f6 ff ff       	call   1002e1 <readline>
  100c89:	83 c4 10             	add    $0x10,%esp
  100c8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c93:	74 e7                	je     100c7c <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100c95:	83 ec 08             	sub    $0x8,%esp
  100c98:	ff 75 08             	pushl  0x8(%ebp)
  100c9b:	ff 75 f4             	pushl  -0xc(%ebp)
  100c9e:	e8 ef fe ff ff       	call   100b92 <runcmd>
  100ca3:	83 c4 10             	add    $0x10,%esp
  100ca6:	85 c0                	test   %eax,%eax
  100ca8:	78 02                	js     100cac <kmonitor+0x6a>
                break;
            }
        }
    }
  100caa:	eb d0                	jmp    100c7c <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100cac:	90                   	nop
            }
        }
    }
}
  100cad:	90                   	nop
  100cae:	c9                   	leave  
  100caf:	c3                   	ret    

00100cb0 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cb0:	55                   	push   %ebp
  100cb1:	89 e5                	mov    %esp,%ebp
  100cb3:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cbd:	eb 3c                	jmp    100cfb <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cbf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cc2:	89 d0                	mov    %edx,%eax
  100cc4:	01 c0                	add    %eax,%eax
  100cc6:	01 d0                	add    %edx,%eax
  100cc8:	c1 e0 02             	shl    $0x2,%eax
  100ccb:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cd0:	8b 08                	mov    (%eax),%ecx
  100cd2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cd5:	89 d0                	mov    %edx,%eax
  100cd7:	01 c0                	add    %eax,%eax
  100cd9:	01 d0                	add    %edx,%eax
  100cdb:	c1 e0 02             	shl    $0x2,%eax
  100cde:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ce3:	8b 00                	mov    (%eax),%eax
  100ce5:	83 ec 04             	sub    $0x4,%esp
  100ce8:	51                   	push   %ecx
  100ce9:	50                   	push   %eax
  100cea:	68 5d 37 10 00       	push   $0x10375d
  100cef:	e8 49 f5 ff ff       	call   10023d <cprintf>
  100cf4:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cfe:	83 f8 02             	cmp    $0x2,%eax
  100d01:	76 bc                	jbe    100cbf <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d03:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d08:	c9                   	leave  
  100d09:	c3                   	ret    

00100d0a <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d0a:	55                   	push   %ebp
  100d0b:	89 e5                	mov    %esp,%ebp
  100d0d:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d10:	e8 c7 fb ff ff       	call   1008dc <print_kerninfo>
    return 0;
  100d15:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d1a:	c9                   	leave  
  100d1b:	c3                   	ret    

00100d1c <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d1c:	55                   	push   %ebp
  100d1d:	89 e5                	mov    %esp,%ebp
  100d1f:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d22:	e8 ff fc ff ff       	call   100a26 <print_stackframe>
    return 0;
  100d27:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d2c:	c9                   	leave  
  100d2d:	c3                   	ret    

00100d2e <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d2e:	55                   	push   %ebp
  100d2f:	89 e5                	mov    %esp,%ebp
  100d31:	83 ec 18             	sub    $0x18,%esp
  100d34:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d3a:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d3e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d42:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d46:	ee                   	out    %al,(%dx)
  100d47:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d4d:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d51:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d55:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d59:	ee                   	out    %al,(%dx)
  100d5a:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d60:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d64:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d68:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6c:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d6d:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d74:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d77:	83 ec 0c             	sub    $0xc,%esp
  100d7a:	68 66 37 10 00       	push   $0x103766
  100d7f:	e8 b9 f4 ff ff       	call   10023d <cprintf>
  100d84:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d87:	83 ec 0c             	sub    $0xc,%esp
  100d8a:	6a 00                	push   $0x0
  100d8c:	e8 ce 08 00 00       	call   10165f <pic_enable>
  100d91:	83 c4 10             	add    $0x10,%esp
}
  100d94:	90                   	nop
  100d95:	c9                   	leave  
  100d96:	c3                   	ret    

00100d97 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d97:	55                   	push   %ebp
  100d98:	89 e5                	mov    %esp,%ebp
  100d9a:	83 ec 10             	sub    $0x10,%esp
  100d9d:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100da3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100da7:	89 c2                	mov    %eax,%edx
  100da9:	ec                   	in     (%dx),%al
  100daa:	88 45 f4             	mov    %al,-0xc(%ebp)
  100dad:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100db3:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100db7:	89 c2                	mov    %eax,%edx
  100db9:	ec                   	in     (%dx),%al
  100dba:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dbd:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dc3:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dc7:	89 c2                	mov    %eax,%edx
  100dc9:	ec                   	in     (%dx),%al
  100dca:	88 45 f6             	mov    %al,-0xa(%ebp)
  100dcd:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100dd3:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100dd7:	89 c2                	mov    %eax,%edx
  100dd9:	ec                   	in     (%dx),%al
  100dda:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100ddd:	90                   	nop
  100dde:	c9                   	leave  
  100ddf:	c3                   	ret    

00100de0 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100de0:	55                   	push   %ebp
  100de1:	89 e5                	mov    %esp,%ebp
  100de3:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100de6:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100ded:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df0:	0f b7 00             	movzwl (%eax),%eax
  100df3:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100df7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dfa:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100dff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e02:	0f b7 00             	movzwl (%eax),%eax
  100e05:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e09:	74 12                	je     100e1d <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e0b:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e12:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e19:	b4 03 
  100e1b:	eb 13                	jmp    100e30 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e20:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e24:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e27:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e2e:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e30:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e37:	0f b7 c0             	movzwl %ax,%eax
  100e3a:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e3e:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e42:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e46:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e4a:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e4b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e52:	83 c0 01             	add    $0x1,%eax
  100e55:	0f b7 c0             	movzwl %ax,%eax
  100e58:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e5c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e60:	89 c2                	mov    %eax,%edx
  100e62:	ec                   	in     (%dx),%al
  100e63:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e66:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e6a:	0f b6 c0             	movzbl %al,%eax
  100e6d:	c1 e0 08             	shl    $0x8,%eax
  100e70:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e73:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7a:	0f b7 c0             	movzwl %ax,%eax
  100e7d:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100e81:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e85:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e89:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100e8d:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e8e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e95:	83 c0 01             	add    $0x1,%eax
  100e98:	0f b7 c0             	movzwl %ax,%eax
  100e9b:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e9f:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ea3:	89 c2                	mov    %eax,%edx
  100ea5:	ec                   	in     (%dx),%al
  100ea6:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ea9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ead:	0f b6 c0             	movzbl %al,%eax
  100eb0:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eb6:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ebe:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ec4:	90                   	nop
  100ec5:	c9                   	leave  
  100ec6:	c3                   	ret    

00100ec7 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ec7:	55                   	push   %ebp
  100ec8:	89 e5                	mov    %esp,%ebp
  100eca:	83 ec 28             	sub    $0x28,%esp
  100ecd:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ed3:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ed7:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100edb:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100edf:	ee                   	out    %al,(%dx)
  100ee0:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100ee6:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100eea:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100eee:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100ef2:	ee                   	out    %al,(%dx)
  100ef3:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100ef9:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100efd:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f01:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f05:	ee                   	out    %al,(%dx)
  100f06:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f0c:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f10:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f14:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100f18:	ee                   	out    %al,(%dx)
  100f19:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f1f:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f23:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f27:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2b:	ee                   	out    %al,(%dx)
  100f2c:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f32:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f36:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f3a:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f3e:	ee                   	out    %al,(%dx)
  100f3f:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f45:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f49:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f4d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f51:	ee                   	out    %al,(%dx)
  100f52:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f58:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f5c:	89 c2                	mov    %eax,%edx
  100f5e:	ec                   	in     (%dx),%al
  100f5f:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f62:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f66:	3c ff                	cmp    $0xff,%al
  100f68:	0f 95 c0             	setne  %al
  100f6b:	0f b6 c0             	movzbl %al,%eax
  100f6e:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f73:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f79:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f7d:	89 c2                	mov    %eax,%edx
  100f7f:	ec                   	in     (%dx),%al
  100f80:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100f83:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100f89:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f8d:	89 c2                	mov    %eax,%edx
  100f8f:	ec                   	in     (%dx),%al
  100f90:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f93:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f98:	85 c0                	test   %eax,%eax
  100f9a:	74 0d                	je     100fa9 <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f9c:	83 ec 0c             	sub    $0xc,%esp
  100f9f:	6a 04                	push   $0x4
  100fa1:	e8 b9 06 00 00       	call   10165f <pic_enable>
  100fa6:	83 c4 10             	add    $0x10,%esp
    }
}
  100fa9:	90                   	nop
  100faa:	c9                   	leave  
  100fab:	c3                   	ret    

00100fac <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fac:	55                   	push   %ebp
  100fad:	89 e5                	mov    %esp,%ebp
  100faf:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fb2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fb9:	eb 09                	jmp    100fc4 <lpt_putc_sub+0x18>
        delay();
  100fbb:	e8 d7 fd ff ff       	call   100d97 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fc4:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fca:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100fce:	89 c2                	mov    %eax,%edx
  100fd0:	ec                   	in     (%dx),%al
  100fd1:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fd4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100fd8:	84 c0                	test   %al,%al
  100fda:	78 09                	js     100fe5 <lpt_putc_sub+0x39>
  100fdc:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fe3:	7e d6                	jle    100fbb <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fe5:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe8:	0f b6 c0             	movzbl %al,%eax
  100feb:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  100ff1:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff4:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100ff8:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100ffc:	ee                   	out    %al,(%dx)
  100ffd:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101003:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101007:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10100b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10100f:	ee                   	out    %al,(%dx)
  101010:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  101016:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  10101a:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  10101e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101022:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101023:	90                   	nop
  101024:	c9                   	leave  
  101025:	c3                   	ret    

00101026 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101026:	55                   	push   %ebp
  101027:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101029:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10102d:	74 0d                	je     10103c <lpt_putc+0x16>
        lpt_putc_sub(c);
  10102f:	ff 75 08             	pushl  0x8(%ebp)
  101032:	e8 75 ff ff ff       	call   100fac <lpt_putc_sub>
  101037:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10103a:	eb 1e                	jmp    10105a <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  10103c:	6a 08                	push   $0x8
  10103e:	e8 69 ff ff ff       	call   100fac <lpt_putc_sub>
  101043:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101046:	6a 20                	push   $0x20
  101048:	e8 5f ff ff ff       	call   100fac <lpt_putc_sub>
  10104d:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101050:	6a 08                	push   $0x8
  101052:	e8 55 ff ff ff       	call   100fac <lpt_putc_sub>
  101057:	83 c4 04             	add    $0x4,%esp
    }
}
  10105a:	90                   	nop
  10105b:	c9                   	leave  
  10105c:	c3                   	ret    

0010105d <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10105d:	55                   	push   %ebp
  10105e:	89 e5                	mov    %esp,%ebp
  101060:	53                   	push   %ebx
  101061:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101064:	8b 45 08             	mov    0x8(%ebp),%eax
  101067:	b0 00                	mov    $0x0,%al
  101069:	85 c0                	test   %eax,%eax
  10106b:	75 07                	jne    101074 <cga_putc+0x17>
        c |= 0x0700;
  10106d:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101074:	8b 45 08             	mov    0x8(%ebp),%eax
  101077:	0f b6 c0             	movzbl %al,%eax
  10107a:	83 f8 0a             	cmp    $0xa,%eax
  10107d:	74 4e                	je     1010cd <cga_putc+0x70>
  10107f:	83 f8 0d             	cmp    $0xd,%eax
  101082:	74 59                	je     1010dd <cga_putc+0x80>
  101084:	83 f8 08             	cmp    $0x8,%eax
  101087:	0f 85 8a 00 00 00    	jne    101117 <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  10108d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101094:	66 85 c0             	test   %ax,%ax
  101097:	0f 84 a0 00 00 00    	je     10113d <cga_putc+0xe0>
            crt_pos --;
  10109d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010a4:	83 e8 01             	sub    $0x1,%eax
  1010a7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010ad:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010b2:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010b9:	0f b7 d2             	movzwl %dx,%edx
  1010bc:	01 d2                	add    %edx,%edx
  1010be:	01 d0                	add    %edx,%eax
  1010c0:	8b 55 08             	mov    0x8(%ebp),%edx
  1010c3:	b2 00                	mov    $0x0,%dl
  1010c5:	83 ca 20             	or     $0x20,%edx
  1010c8:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010cb:	eb 70                	jmp    10113d <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  1010cd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d4:	83 c0 50             	add    $0x50,%eax
  1010d7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010dd:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010e4:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010eb:	0f b7 c1             	movzwl %cx,%eax
  1010ee:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010f4:	c1 e8 10             	shr    $0x10,%eax
  1010f7:	89 c2                	mov    %eax,%edx
  1010f9:	66 c1 ea 06          	shr    $0x6,%dx
  1010fd:	89 d0                	mov    %edx,%eax
  1010ff:	c1 e0 02             	shl    $0x2,%eax
  101102:	01 d0                	add    %edx,%eax
  101104:	c1 e0 04             	shl    $0x4,%eax
  101107:	29 c1                	sub    %eax,%ecx
  101109:	89 ca                	mov    %ecx,%edx
  10110b:	89 d8                	mov    %ebx,%eax
  10110d:	29 d0                	sub    %edx,%eax
  10110f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101115:	eb 27                	jmp    10113e <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101117:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10111d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101124:	8d 50 01             	lea    0x1(%eax),%edx
  101127:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10112e:	0f b7 c0             	movzwl %ax,%eax
  101131:	01 c0                	add    %eax,%eax
  101133:	01 c8                	add    %ecx,%eax
  101135:	8b 55 08             	mov    0x8(%ebp),%edx
  101138:	66 89 10             	mov    %dx,(%eax)
        break;
  10113b:	eb 01                	jmp    10113e <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10113d:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10113e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101145:	66 3d cf 07          	cmp    $0x7cf,%ax
  101149:	76 59                	jbe    1011a4 <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10114b:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101150:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101156:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10115b:	83 ec 04             	sub    $0x4,%esp
  10115e:	68 00 0f 00 00       	push   $0xf00
  101163:	52                   	push   %edx
  101164:	50                   	push   %eax
  101165:	e8 65 1b 00 00       	call   102ccf <memmove>
  10116a:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10116d:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101174:	eb 15                	jmp    10118b <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  101176:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10117b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10117e:	01 d2                	add    %edx,%edx
  101180:	01 d0                	add    %edx,%eax
  101182:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101187:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10118b:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101192:	7e e2                	jle    101176 <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101194:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10119b:	83 e8 50             	sub    $0x50,%eax
  10119e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011a4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011ab:	0f b7 c0             	movzwl %ax,%eax
  1011ae:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011b2:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011b6:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011ba:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011be:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011bf:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c6:	66 c1 e8 08          	shr    $0x8,%ax
  1011ca:	0f b6 c0             	movzbl %al,%eax
  1011cd:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011d4:	83 c2 01             	add    $0x1,%edx
  1011d7:	0f b7 d2             	movzwl %dx,%edx
  1011da:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  1011de:	88 45 e9             	mov    %al,-0x17(%ebp)
  1011e1:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011e5:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1011e9:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011ea:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011f1:	0f b7 c0             	movzwl %ax,%eax
  1011f4:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1011f8:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  1011fc:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101200:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101204:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101205:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10120c:	0f b6 c0             	movzbl %al,%eax
  10120f:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101216:	83 c2 01             	add    $0x1,%edx
  101219:	0f b7 d2             	movzwl %dx,%edx
  10121c:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101220:	88 45 eb             	mov    %al,-0x15(%ebp)
  101223:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  101227:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10122b:	ee                   	out    %al,(%dx)
}
  10122c:	90                   	nop
  10122d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101230:	c9                   	leave  
  101231:	c3                   	ret    

00101232 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101232:	55                   	push   %ebp
  101233:	89 e5                	mov    %esp,%ebp
  101235:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101238:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10123f:	eb 09                	jmp    10124a <serial_putc_sub+0x18>
        delay();
  101241:	e8 51 fb ff ff       	call   100d97 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101246:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10124a:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101250:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101254:	89 c2                	mov    %eax,%edx
  101256:	ec                   	in     (%dx),%al
  101257:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  10125a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10125e:	0f b6 c0             	movzbl %al,%eax
  101261:	83 e0 20             	and    $0x20,%eax
  101264:	85 c0                	test   %eax,%eax
  101266:	75 09                	jne    101271 <serial_putc_sub+0x3f>
  101268:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10126f:	7e d0                	jle    101241 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101271:	8b 45 08             	mov    0x8(%ebp),%eax
  101274:	0f b6 c0             	movzbl %al,%eax
  101277:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  10127d:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101280:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  101284:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101288:	ee                   	out    %al,(%dx)
}
  101289:	90                   	nop
  10128a:	c9                   	leave  
  10128b:	c3                   	ret    

0010128c <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10128c:	55                   	push   %ebp
  10128d:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10128f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101293:	74 0d                	je     1012a2 <serial_putc+0x16>
        serial_putc_sub(c);
  101295:	ff 75 08             	pushl  0x8(%ebp)
  101298:	e8 95 ff ff ff       	call   101232 <serial_putc_sub>
  10129d:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012a0:	eb 1e                	jmp    1012c0 <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012a2:	6a 08                	push   $0x8
  1012a4:	e8 89 ff ff ff       	call   101232 <serial_putc_sub>
  1012a9:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012ac:	6a 20                	push   $0x20
  1012ae:	e8 7f ff ff ff       	call   101232 <serial_putc_sub>
  1012b3:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012b6:	6a 08                	push   $0x8
  1012b8:	e8 75 ff ff ff       	call   101232 <serial_putc_sub>
  1012bd:	83 c4 04             	add    $0x4,%esp
    }
}
  1012c0:	90                   	nop
  1012c1:	c9                   	leave  
  1012c2:	c3                   	ret    

001012c3 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012c3:	55                   	push   %ebp
  1012c4:	89 e5                	mov    %esp,%ebp
  1012c6:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012c9:	eb 33                	jmp    1012fe <cons_intr+0x3b>
        if (c != 0) {
  1012cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012cf:	74 2d                	je     1012fe <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012d1:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012d6:	8d 50 01             	lea    0x1(%eax),%edx
  1012d9:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012df:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012e2:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012e8:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012ed:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012f2:	75 0a                	jne    1012fe <cons_intr+0x3b>
                cons.wpos = 0;
  1012f4:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1012fb:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  1012fe:	8b 45 08             	mov    0x8(%ebp),%eax
  101301:	ff d0                	call   *%eax
  101303:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101306:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10130a:	75 bf                	jne    1012cb <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10130c:	90                   	nop
  10130d:	c9                   	leave  
  10130e:	c3                   	ret    

0010130f <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10130f:	55                   	push   %ebp
  101310:	89 e5                	mov    %esp,%ebp
  101312:	83 ec 10             	sub    $0x10,%esp
  101315:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10131b:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  10131f:	89 c2                	mov    %eax,%edx
  101321:	ec                   	in     (%dx),%al
  101322:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101325:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101329:	0f b6 c0             	movzbl %al,%eax
  10132c:	83 e0 01             	and    $0x1,%eax
  10132f:	85 c0                	test   %eax,%eax
  101331:	75 07                	jne    10133a <serial_proc_data+0x2b>
        return -1;
  101333:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101338:	eb 2a                	jmp    101364 <serial_proc_data+0x55>
  10133a:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101340:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101344:	89 c2                	mov    %eax,%edx
  101346:	ec                   	in     (%dx),%al
  101347:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  10134a:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10134e:	0f b6 c0             	movzbl %al,%eax
  101351:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101354:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101358:	75 07                	jne    101361 <serial_proc_data+0x52>
        c = '\b';
  10135a:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101361:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101364:	c9                   	leave  
  101365:	c3                   	ret    

00101366 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101366:	55                   	push   %ebp
  101367:	89 e5                	mov    %esp,%ebp
  101369:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10136c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101371:	85 c0                	test   %eax,%eax
  101373:	74 10                	je     101385 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101375:	83 ec 0c             	sub    $0xc,%esp
  101378:	68 0f 13 10 00       	push   $0x10130f
  10137d:	e8 41 ff ff ff       	call   1012c3 <cons_intr>
  101382:	83 c4 10             	add    $0x10,%esp
    }
}
  101385:	90                   	nop
  101386:	c9                   	leave  
  101387:	c3                   	ret    

00101388 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101388:	55                   	push   %ebp
  101389:	89 e5                	mov    %esp,%ebp
  10138b:	83 ec 18             	sub    $0x18,%esp
  10138e:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101394:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101398:	89 c2                	mov    %eax,%edx
  10139a:	ec                   	in     (%dx),%al
  10139b:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10139e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013a2:	0f b6 c0             	movzbl %al,%eax
  1013a5:	83 e0 01             	and    $0x1,%eax
  1013a8:	85 c0                	test   %eax,%eax
  1013aa:	75 0a                	jne    1013b6 <kbd_proc_data+0x2e>
        return -1;
  1013ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013b1:	e9 5d 01 00 00       	jmp    101513 <kbd_proc_data+0x18b>
  1013b6:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013bc:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c0:	89 c2                	mov    %eax,%edx
  1013c2:	ec                   	in     (%dx),%al
  1013c3:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013c6:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013ca:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013cd:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013d1:	75 17                	jne    1013ea <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013d3:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013d8:	83 c8 40             	or     $0x40,%eax
  1013db:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013e0:	b8 00 00 00 00       	mov    $0x0,%eax
  1013e5:	e9 29 01 00 00       	jmp    101513 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013ea:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013ee:	84 c0                	test   %al,%al
  1013f0:	79 47                	jns    101439 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013f2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f7:	83 e0 40             	and    $0x40,%eax
  1013fa:	85 c0                	test   %eax,%eax
  1013fc:	75 09                	jne    101407 <kbd_proc_data+0x7f>
  1013fe:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101402:	83 e0 7f             	and    $0x7f,%eax
  101405:	eb 04                	jmp    10140b <kbd_proc_data+0x83>
  101407:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140b:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10140e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101412:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101419:	83 c8 40             	or     $0x40,%eax
  10141c:	0f b6 c0             	movzbl %al,%eax
  10141f:	f7 d0                	not    %eax
  101421:	89 c2                	mov    %eax,%edx
  101423:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101428:	21 d0                	and    %edx,%eax
  10142a:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10142f:	b8 00 00 00 00       	mov    $0x0,%eax
  101434:	e9 da 00 00 00       	jmp    101513 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  101439:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10143e:	83 e0 40             	and    $0x40,%eax
  101441:	85 c0                	test   %eax,%eax
  101443:	74 11                	je     101456 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101445:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101449:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10144e:	83 e0 bf             	and    $0xffffffbf,%eax
  101451:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101456:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145a:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101461:	0f b6 d0             	movzbl %al,%edx
  101464:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101469:	09 d0                	or     %edx,%eax
  10146b:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101470:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101474:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10147b:	0f b6 d0             	movzbl %al,%edx
  10147e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101483:	31 d0                	xor    %edx,%eax
  101485:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  10148a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148f:	83 e0 03             	and    $0x3,%eax
  101492:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101499:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149d:	01 d0                	add    %edx,%eax
  10149f:	0f b6 00             	movzbl (%eax),%eax
  1014a2:	0f b6 c0             	movzbl %al,%eax
  1014a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014a8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ad:	83 e0 08             	and    $0x8,%eax
  1014b0:	85 c0                	test   %eax,%eax
  1014b2:	74 22                	je     1014d6 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014b4:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014b8:	7e 0c                	jle    1014c6 <kbd_proc_data+0x13e>
  1014ba:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014be:	7f 06                	jg     1014c6 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014c0:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014c4:	eb 10                	jmp    1014d6 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014c6:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014ca:	7e 0a                	jle    1014d6 <kbd_proc_data+0x14e>
  1014cc:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014d0:	7f 04                	jg     1014d6 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014d2:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014d6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014db:	f7 d0                	not    %eax
  1014dd:	83 e0 06             	and    $0x6,%eax
  1014e0:	85 c0                	test   %eax,%eax
  1014e2:	75 2c                	jne    101510 <kbd_proc_data+0x188>
  1014e4:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014eb:	75 23                	jne    101510 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014ed:	83 ec 0c             	sub    $0xc,%esp
  1014f0:	68 81 37 10 00       	push   $0x103781
  1014f5:	e8 43 ed ff ff       	call   10023d <cprintf>
  1014fa:	83 c4 10             	add    $0x10,%esp
  1014fd:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101503:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101507:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10150b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10150f:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101510:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101513:	c9                   	leave  
  101514:	c3                   	ret    

00101515 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101515:	55                   	push   %ebp
  101516:	89 e5                	mov    %esp,%ebp
  101518:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  10151b:	83 ec 0c             	sub    $0xc,%esp
  10151e:	68 88 13 10 00       	push   $0x101388
  101523:	e8 9b fd ff ff       	call   1012c3 <cons_intr>
  101528:	83 c4 10             	add    $0x10,%esp
}
  10152b:	90                   	nop
  10152c:	c9                   	leave  
  10152d:	c3                   	ret    

0010152e <kbd_init>:

static void
kbd_init(void) {
  10152e:	55                   	push   %ebp
  10152f:	89 e5                	mov    %esp,%ebp
  101531:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101534:	e8 dc ff ff ff       	call   101515 <kbd_intr>
    pic_enable(IRQ_KBD);
  101539:	83 ec 0c             	sub    $0xc,%esp
  10153c:	6a 01                	push   $0x1
  10153e:	e8 1c 01 00 00       	call   10165f <pic_enable>
  101543:	83 c4 10             	add    $0x10,%esp
}
  101546:	90                   	nop
  101547:	c9                   	leave  
  101548:	c3                   	ret    

00101549 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101549:	55                   	push   %ebp
  10154a:	89 e5                	mov    %esp,%ebp
  10154c:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  10154f:	e8 8c f8 ff ff       	call   100de0 <cga_init>
    serial_init();
  101554:	e8 6e f9 ff ff       	call   100ec7 <serial_init>
    kbd_init();
  101559:	e8 d0 ff ff ff       	call   10152e <kbd_init>
    if (!serial_exists) {
  10155e:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101563:	85 c0                	test   %eax,%eax
  101565:	75 10                	jne    101577 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101567:	83 ec 0c             	sub    $0xc,%esp
  10156a:	68 8d 37 10 00       	push   $0x10378d
  10156f:	e8 c9 ec ff ff       	call   10023d <cprintf>
  101574:	83 c4 10             	add    $0x10,%esp
    }
}
  101577:	90                   	nop
  101578:	c9                   	leave  
  101579:	c3                   	ret    

0010157a <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10157a:	55                   	push   %ebp
  10157b:	89 e5                	mov    %esp,%ebp
  10157d:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101580:	ff 75 08             	pushl  0x8(%ebp)
  101583:	e8 9e fa ff ff       	call   101026 <lpt_putc>
  101588:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  10158b:	83 ec 0c             	sub    $0xc,%esp
  10158e:	ff 75 08             	pushl  0x8(%ebp)
  101591:	e8 c7 fa ff ff       	call   10105d <cga_putc>
  101596:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  101599:	83 ec 0c             	sub    $0xc,%esp
  10159c:	ff 75 08             	pushl  0x8(%ebp)
  10159f:	e8 e8 fc ff ff       	call   10128c <serial_putc>
  1015a4:	83 c4 10             	add    $0x10,%esp
}
  1015a7:	90                   	nop
  1015a8:	c9                   	leave  
  1015a9:	c3                   	ret    

001015aa <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015aa:	55                   	push   %ebp
  1015ab:	89 e5                	mov    %esp,%ebp
  1015ad:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015b0:	e8 b1 fd ff ff       	call   101366 <serial_intr>
    kbd_intr();
  1015b5:	e8 5b ff ff ff       	call   101515 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015ba:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015c0:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015c5:	39 c2                	cmp    %eax,%edx
  1015c7:	74 36                	je     1015ff <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015c9:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ce:	8d 50 01             	lea    0x1(%eax),%edx
  1015d1:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015d7:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015de:	0f b6 c0             	movzbl %al,%eax
  1015e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015e4:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015ee:	75 0a                	jne    1015fa <cons_getc+0x50>
            cons.rpos = 0;
  1015f0:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015f7:	00 00 00 
        }
        return c;
  1015fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015fd:	eb 05                	jmp    101604 <cons_getc+0x5a>
    }
    return 0;
  1015ff:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101604:	c9                   	leave  
  101605:	c3                   	ret    

00101606 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101606:	55                   	push   %ebp
  101607:	89 e5                	mov    %esp,%ebp
  101609:	83 ec 14             	sub    $0x14,%esp
  10160c:	8b 45 08             	mov    0x8(%ebp),%eax
  10160f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101613:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101617:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10161d:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101622:	85 c0                	test   %eax,%eax
  101624:	74 36                	je     10165c <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101626:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10162a:	0f b6 c0             	movzbl %al,%eax
  10162d:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101633:	88 45 fa             	mov    %al,-0x6(%ebp)
  101636:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10163a:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10163e:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10163f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101643:	66 c1 e8 08          	shr    $0x8,%ax
  101647:	0f b6 c0             	movzbl %al,%eax
  10164a:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101650:	88 45 fb             	mov    %al,-0x5(%ebp)
  101653:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  101657:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10165b:	ee                   	out    %al,(%dx)
    }
}
  10165c:	90                   	nop
  10165d:	c9                   	leave  
  10165e:	c3                   	ret    

0010165f <pic_enable>:

void
pic_enable(unsigned int irq) {
  10165f:	55                   	push   %ebp
  101660:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101662:	8b 45 08             	mov    0x8(%ebp),%eax
  101665:	ba 01 00 00 00       	mov    $0x1,%edx
  10166a:	89 c1                	mov    %eax,%ecx
  10166c:	d3 e2                	shl    %cl,%edx
  10166e:	89 d0                	mov    %edx,%eax
  101670:	f7 d0                	not    %eax
  101672:	89 c2                	mov    %eax,%edx
  101674:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10167b:	21 d0                	and    %edx,%eax
  10167d:	0f b7 c0             	movzwl %ax,%eax
  101680:	50                   	push   %eax
  101681:	e8 80 ff ff ff       	call   101606 <pic_setmask>
  101686:	83 c4 04             	add    $0x4,%esp
}
  101689:	90                   	nop
  10168a:	c9                   	leave  
  10168b:	c3                   	ret    

0010168c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10168c:	55                   	push   %ebp
  10168d:	89 e5                	mov    %esp,%ebp
  10168f:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  101692:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101699:	00 00 00 
  10169c:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016a2:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016a6:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016aa:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016ae:	ee                   	out    %al,(%dx)
  1016af:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016b5:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016b9:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016bd:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016c1:	ee                   	out    %al,(%dx)
  1016c2:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016c8:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016cc:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016d0:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d4:	ee                   	out    %al,(%dx)
  1016d5:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016db:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016df:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016e3:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1016e7:	ee                   	out    %al,(%dx)
  1016e8:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  1016ee:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  1016f2:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  1016f6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016fa:	ee                   	out    %al,(%dx)
  1016fb:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101701:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  101705:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  101709:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  10170d:	ee                   	out    %al,(%dx)
  10170e:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  101714:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  101718:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  10171c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101720:	ee                   	out    %al,(%dx)
  101721:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  101727:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  10172b:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10172f:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101733:	ee                   	out    %al,(%dx)
  101734:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10173a:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  10173e:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101742:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101746:	ee                   	out    %al,(%dx)
  101747:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  10174d:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101751:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101755:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101759:	ee                   	out    %al,(%dx)
  10175a:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101760:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101764:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  101768:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10176c:	ee                   	out    %al,(%dx)
  10176d:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  101773:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  101777:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10177b:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10177f:	ee                   	out    %al,(%dx)
  101780:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101786:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  10178a:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  10178e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101792:	ee                   	out    %al,(%dx)
  101793:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  101799:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  10179d:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017a1:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  1017a5:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017a6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ad:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017b1:	74 13                	je     1017c6 <pic_init+0x13a>
        pic_setmask(irq_mask);
  1017b3:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ba:	0f b7 c0             	movzwl %ax,%eax
  1017bd:	50                   	push   %eax
  1017be:	e8 43 fe ff ff       	call   101606 <pic_setmask>
  1017c3:	83 c4 04             	add    $0x4,%esp
    }
}
  1017c6:	90                   	nop
  1017c7:	c9                   	leave  
  1017c8:	c3                   	ret    

001017c9 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017c9:	55                   	push   %ebp
  1017ca:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017cc:	fb                   	sti    
    sti();
}
  1017cd:	90                   	nop
  1017ce:	5d                   	pop    %ebp
  1017cf:	c3                   	ret    

001017d0 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017d0:	55                   	push   %ebp
  1017d1:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017d3:	fa                   	cli    
    cli();
}
  1017d4:	90                   	nop
  1017d5:	5d                   	pop    %ebp
  1017d6:	c3                   	ret    

001017d7 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017d7:	55                   	push   %ebp
  1017d8:	89 e5                	mov    %esp,%ebp
  1017da:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017dd:	83 ec 08             	sub    $0x8,%esp
  1017e0:	6a 64                	push   $0x64
  1017e2:	68 c0 37 10 00       	push   $0x1037c0
  1017e7:	e8 51 ea ff ff       	call   10023d <cprintf>
  1017ec:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  1017ef:	83 ec 0c             	sub    $0xc,%esp
  1017f2:	68 ca 37 10 00       	push   $0x1037ca
  1017f7:	e8 41 ea ff ff       	call   10023d <cprintf>
  1017fc:	83 c4 10             	add    $0x10,%esp
    panic("EOT: kernel seems ok.");
  1017ff:	83 ec 04             	sub    $0x4,%esp
  101802:	68 d8 37 10 00       	push   $0x1037d8
  101807:	6a 12                	push   $0x12
  101809:	68 ee 37 10 00       	push   $0x1037ee
  10180e:	e8 90 eb ff ff       	call   1003a3 <__panic>

00101813 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101813:	55                   	push   %ebp
  101814:	89 e5                	mov    %esp,%ebp
  101816:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < sizeof(idt); i++) {
  101819:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101820:	e9 c3 00 00 00       	jmp    1018e8 <idt_init+0xd5>
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101825:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101828:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10182f:	89 c2                	mov    %eax,%edx
  101831:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101834:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10183b:	00 
  10183c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183f:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101846:	00 08 00 
  101849:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184c:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101853:	00 
  101854:	83 e2 e0             	and    $0xffffffe0,%edx
  101857:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10185e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101861:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101868:	00 
  101869:	83 e2 1f             	and    $0x1f,%edx
  10186c:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101873:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101876:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187d:	00 
  10187e:	83 e2 f0             	and    $0xfffffff0,%edx
  101881:	83 ca 0e             	or     $0xe,%edx
  101884:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188e:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101895:	00 
  101896:	83 e2 ef             	and    $0xffffffef,%edx
  101899:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a3:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018aa:	00 
  1018ab:	83 e2 9f             	and    $0xffffff9f,%edx
  1018ae:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b8:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018bf:	00 
  1018c0:	83 ca 80             	or     $0xffffff80,%edx
  1018c3:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cd:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018d4:	c1 e8 10             	shr    $0x10,%eax
  1018d7:	89 c2                	mov    %eax,%edx
  1018d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018dc:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018e3:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < sizeof(idt); i++) {
  1018e4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018eb:	3d ff 07 00 00       	cmp    $0x7ff,%eax
  1018f0:	0f 86 2f ff ff ff    	jbe    101825 <idt_init+0x12>
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
	}
		SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  1018f6:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018fb:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101901:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101908:	08 00 
  10190a:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101911:	83 e0 e0             	and    $0xffffffe0,%eax
  101914:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101919:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101920:	83 e0 1f             	and    $0x1f,%eax
  101923:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101928:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10192f:	83 e0 f0             	and    $0xfffffff0,%eax
  101932:	83 c8 0e             	or     $0xe,%eax
  101935:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10193a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101941:	83 e0 ef             	and    $0xffffffef,%eax
  101944:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101949:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101950:	83 c8 60             	or     $0x60,%eax
  101953:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101958:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10195f:	83 c8 80             	or     $0xffffff80,%eax
  101962:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101967:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10196c:	c1 e8 10             	shr    $0x10,%eax
  10196f:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101975:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  10197c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10197f:	0f 01 18             	lidtl  (%eax)
	lidt(&idt_pd);
}
  101982:	90                   	nop
  101983:	c9                   	leave  
  101984:	c3                   	ret    

00101985 <trapname>:

static const char *
trapname(int trapno) {
  101985:	55                   	push   %ebp
  101986:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101988:	8b 45 08             	mov    0x8(%ebp),%eax
  10198b:	83 f8 13             	cmp    $0x13,%eax
  10198e:	77 0c                	ja     10199c <trapname+0x17>
        return excnames[trapno];
  101990:	8b 45 08             	mov    0x8(%ebp),%eax
  101993:	8b 04 85 40 3b 10 00 	mov    0x103b40(,%eax,4),%eax
  10199a:	eb 18                	jmp    1019b4 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10199c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019a0:	7e 0d                	jle    1019af <trapname+0x2a>
  1019a2:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019a6:	7f 07                	jg     1019af <trapname+0x2a>
        return "Hardware Interrupt";
  1019a8:	b8 ff 37 10 00       	mov    $0x1037ff,%eax
  1019ad:	eb 05                	jmp    1019b4 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019af:	b8 12 38 10 00       	mov    $0x103812,%eax
}
  1019b4:	5d                   	pop    %ebp
  1019b5:	c3                   	ret    

001019b6 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019b6:	55                   	push   %ebp
  1019b7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019c0:	66 83 f8 08          	cmp    $0x8,%ax
  1019c4:	0f 94 c0             	sete   %al
  1019c7:	0f b6 c0             	movzbl %al,%eax
}
  1019ca:	5d                   	pop    %ebp
  1019cb:	c3                   	ret    

001019cc <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019cc:	55                   	push   %ebp
  1019cd:	89 e5                	mov    %esp,%ebp
  1019cf:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  1019d2:	83 ec 08             	sub    $0x8,%esp
  1019d5:	ff 75 08             	pushl  0x8(%ebp)
  1019d8:	68 53 38 10 00       	push   $0x103853
  1019dd:	e8 5b e8 ff ff       	call   10023d <cprintf>
  1019e2:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  1019e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e8:	83 ec 0c             	sub    $0xc,%esp
  1019eb:	50                   	push   %eax
  1019ec:	e8 b8 01 00 00       	call   101ba9 <print_regs>
  1019f1:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f7:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019fb:	0f b7 c0             	movzwl %ax,%eax
  1019fe:	83 ec 08             	sub    $0x8,%esp
  101a01:	50                   	push   %eax
  101a02:	68 64 38 10 00       	push   $0x103864
  101a07:	e8 31 e8 ff ff       	call   10023d <cprintf>
  101a0c:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a12:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a16:	0f b7 c0             	movzwl %ax,%eax
  101a19:	83 ec 08             	sub    $0x8,%esp
  101a1c:	50                   	push   %eax
  101a1d:	68 77 38 10 00       	push   $0x103877
  101a22:	e8 16 e8 ff ff       	call   10023d <cprintf>
  101a27:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2d:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a31:	0f b7 c0             	movzwl %ax,%eax
  101a34:	83 ec 08             	sub    $0x8,%esp
  101a37:	50                   	push   %eax
  101a38:	68 8a 38 10 00       	push   $0x10388a
  101a3d:	e8 fb e7 ff ff       	call   10023d <cprintf>
  101a42:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a45:	8b 45 08             	mov    0x8(%ebp),%eax
  101a48:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a4c:	0f b7 c0             	movzwl %ax,%eax
  101a4f:	83 ec 08             	sub    $0x8,%esp
  101a52:	50                   	push   %eax
  101a53:	68 9d 38 10 00       	push   $0x10389d
  101a58:	e8 e0 e7 ff ff       	call   10023d <cprintf>
  101a5d:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a60:	8b 45 08             	mov    0x8(%ebp),%eax
  101a63:	8b 40 30             	mov    0x30(%eax),%eax
  101a66:	83 ec 0c             	sub    $0xc,%esp
  101a69:	50                   	push   %eax
  101a6a:	e8 16 ff ff ff       	call   101985 <trapname>
  101a6f:	83 c4 10             	add    $0x10,%esp
  101a72:	89 c2                	mov    %eax,%edx
  101a74:	8b 45 08             	mov    0x8(%ebp),%eax
  101a77:	8b 40 30             	mov    0x30(%eax),%eax
  101a7a:	83 ec 04             	sub    $0x4,%esp
  101a7d:	52                   	push   %edx
  101a7e:	50                   	push   %eax
  101a7f:	68 b0 38 10 00       	push   $0x1038b0
  101a84:	e8 b4 e7 ff ff       	call   10023d <cprintf>
  101a89:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a8c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8f:	8b 40 34             	mov    0x34(%eax),%eax
  101a92:	83 ec 08             	sub    $0x8,%esp
  101a95:	50                   	push   %eax
  101a96:	68 c2 38 10 00       	push   $0x1038c2
  101a9b:	e8 9d e7 ff ff       	call   10023d <cprintf>
  101aa0:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa6:	8b 40 38             	mov    0x38(%eax),%eax
  101aa9:	83 ec 08             	sub    $0x8,%esp
  101aac:	50                   	push   %eax
  101aad:	68 d1 38 10 00       	push   $0x1038d1
  101ab2:	e8 86 e7 ff ff       	call   10023d <cprintf>
  101ab7:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101aba:	8b 45 08             	mov    0x8(%ebp),%eax
  101abd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ac1:	0f b7 c0             	movzwl %ax,%eax
  101ac4:	83 ec 08             	sub    $0x8,%esp
  101ac7:	50                   	push   %eax
  101ac8:	68 e0 38 10 00       	push   $0x1038e0
  101acd:	e8 6b e7 ff ff       	call   10023d <cprintf>
  101ad2:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ad5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad8:	8b 40 40             	mov    0x40(%eax),%eax
  101adb:	83 ec 08             	sub    $0x8,%esp
  101ade:	50                   	push   %eax
  101adf:	68 f3 38 10 00       	push   $0x1038f3
  101ae4:	e8 54 e7 ff ff       	call   10023d <cprintf>
  101ae9:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101af3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101afa:	eb 3f                	jmp    101b3b <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101afc:	8b 45 08             	mov    0x8(%ebp),%eax
  101aff:	8b 50 40             	mov    0x40(%eax),%edx
  101b02:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b05:	21 d0                	and    %edx,%eax
  101b07:	85 c0                	test   %eax,%eax
  101b09:	74 29                	je     101b34 <print_trapframe+0x168>
  101b0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b0e:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b15:	85 c0                	test   %eax,%eax
  101b17:	74 1b                	je     101b34 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1c:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b23:	83 ec 08             	sub    $0x8,%esp
  101b26:	50                   	push   %eax
  101b27:	68 02 39 10 00       	push   $0x103902
  101b2c:	e8 0c e7 ff ff       	call   10023d <cprintf>
  101b31:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b38:	d1 65 f0             	shll   -0x10(%ebp)
  101b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3e:	83 f8 17             	cmp    $0x17,%eax
  101b41:	76 b9                	jbe    101afc <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b43:	8b 45 08             	mov    0x8(%ebp),%eax
  101b46:	8b 40 40             	mov    0x40(%eax),%eax
  101b49:	25 00 30 00 00       	and    $0x3000,%eax
  101b4e:	c1 e8 0c             	shr    $0xc,%eax
  101b51:	83 ec 08             	sub    $0x8,%esp
  101b54:	50                   	push   %eax
  101b55:	68 06 39 10 00       	push   $0x103906
  101b5a:	e8 de e6 ff ff       	call   10023d <cprintf>
  101b5f:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b62:	83 ec 0c             	sub    $0xc,%esp
  101b65:	ff 75 08             	pushl  0x8(%ebp)
  101b68:	e8 49 fe ff ff       	call   1019b6 <trap_in_kernel>
  101b6d:	83 c4 10             	add    $0x10,%esp
  101b70:	85 c0                	test   %eax,%eax
  101b72:	75 32                	jne    101ba6 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b74:	8b 45 08             	mov    0x8(%ebp),%eax
  101b77:	8b 40 44             	mov    0x44(%eax),%eax
  101b7a:	83 ec 08             	sub    $0x8,%esp
  101b7d:	50                   	push   %eax
  101b7e:	68 0f 39 10 00       	push   $0x10390f
  101b83:	e8 b5 e6 ff ff       	call   10023d <cprintf>
  101b88:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8e:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b92:	0f b7 c0             	movzwl %ax,%eax
  101b95:	83 ec 08             	sub    $0x8,%esp
  101b98:	50                   	push   %eax
  101b99:	68 1e 39 10 00       	push   $0x10391e
  101b9e:	e8 9a e6 ff ff       	call   10023d <cprintf>
  101ba3:	83 c4 10             	add    $0x10,%esp
    }
}
  101ba6:	90                   	nop
  101ba7:	c9                   	leave  
  101ba8:	c3                   	ret    

00101ba9 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101ba9:	55                   	push   %ebp
  101baa:	89 e5                	mov    %esp,%ebp
  101bac:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101baf:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb2:	8b 00                	mov    (%eax),%eax
  101bb4:	83 ec 08             	sub    $0x8,%esp
  101bb7:	50                   	push   %eax
  101bb8:	68 31 39 10 00       	push   $0x103931
  101bbd:	e8 7b e6 ff ff       	call   10023d <cprintf>
  101bc2:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bc5:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc8:	8b 40 04             	mov    0x4(%eax),%eax
  101bcb:	83 ec 08             	sub    $0x8,%esp
  101bce:	50                   	push   %eax
  101bcf:	68 40 39 10 00       	push   $0x103940
  101bd4:	e8 64 e6 ff ff       	call   10023d <cprintf>
  101bd9:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bdc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdf:	8b 40 08             	mov    0x8(%eax),%eax
  101be2:	83 ec 08             	sub    $0x8,%esp
  101be5:	50                   	push   %eax
  101be6:	68 4f 39 10 00       	push   $0x10394f
  101beb:	e8 4d e6 ff ff       	call   10023d <cprintf>
  101bf0:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf6:	8b 40 0c             	mov    0xc(%eax),%eax
  101bf9:	83 ec 08             	sub    $0x8,%esp
  101bfc:	50                   	push   %eax
  101bfd:	68 5e 39 10 00       	push   $0x10395e
  101c02:	e8 36 e6 ff ff       	call   10023d <cprintf>
  101c07:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0d:	8b 40 10             	mov    0x10(%eax),%eax
  101c10:	83 ec 08             	sub    $0x8,%esp
  101c13:	50                   	push   %eax
  101c14:	68 6d 39 10 00       	push   $0x10396d
  101c19:	e8 1f e6 ff ff       	call   10023d <cprintf>
  101c1e:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c21:	8b 45 08             	mov    0x8(%ebp),%eax
  101c24:	8b 40 14             	mov    0x14(%eax),%eax
  101c27:	83 ec 08             	sub    $0x8,%esp
  101c2a:	50                   	push   %eax
  101c2b:	68 7c 39 10 00       	push   $0x10397c
  101c30:	e8 08 e6 ff ff       	call   10023d <cprintf>
  101c35:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c38:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3b:	8b 40 18             	mov    0x18(%eax),%eax
  101c3e:	83 ec 08             	sub    $0x8,%esp
  101c41:	50                   	push   %eax
  101c42:	68 8b 39 10 00       	push   $0x10398b
  101c47:	e8 f1 e5 ff ff       	call   10023d <cprintf>
  101c4c:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c52:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c55:	83 ec 08             	sub    $0x8,%esp
  101c58:	50                   	push   %eax
  101c59:	68 9a 39 10 00       	push   $0x10399a
  101c5e:	e8 da e5 ff ff       	call   10023d <cprintf>
  101c63:	83 c4 10             	add    $0x10,%esp
}
  101c66:	90                   	nop
  101c67:	c9                   	leave  
  101c68:	c3                   	ret    

00101c69 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c69:	55                   	push   %ebp
  101c6a:	89 e5                	mov    %esp,%ebp
  101c6c:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101c6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c72:	8b 40 30             	mov    0x30(%eax),%eax
  101c75:	83 f8 2f             	cmp    $0x2f,%eax
  101c78:	77 1d                	ja     101c97 <trap_dispatch+0x2e>
  101c7a:	83 f8 2e             	cmp    $0x2e,%eax
  101c7d:	0f 83 e6 00 00 00    	jae    101d69 <trap_dispatch+0x100>
  101c83:	83 f8 21             	cmp    $0x21,%eax
  101c86:	74 70                	je     101cf8 <trap_dispatch+0x8f>
  101c88:	83 f8 24             	cmp    $0x24,%eax
  101c8b:	74 47                	je     101cd4 <trap_dispatch+0x6b>
  101c8d:	83 f8 20             	cmp    $0x20,%eax
  101c90:	74 13                	je     101ca5 <trap_dispatch+0x3c>
  101c92:	e9 9c 00 00 00       	jmp    101d33 <trap_dispatch+0xca>
  101c97:	83 e8 78             	sub    $0x78,%eax
  101c9a:	83 f8 01             	cmp    $0x1,%eax
  101c9d:	0f 87 90 00 00 00    	ja     101d33 <trap_dispatch+0xca>
  101ca3:	eb 77                	jmp    101d1c <trap_dispatch+0xb3>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
	    ticks++;
  101ca5:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101caa:	83 c0 01             	add    $0x1,%eax
  101cad:	a3 08 f9 10 00       	mov    %eax,0x10f908
	    if(ticks == 100) {
  101cb2:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cb7:	83 f8 64             	cmp    $0x64,%eax
  101cba:	0f 85 ac 00 00 00    	jne    101d6c <trap_dispatch+0x103>
	    	ticks = 0;
  101cc0:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101cc7:	00 00 00 
	    	print_ticks();
  101cca:	e8 08 fb ff ff       	call   1017d7 <print_ticks>
	    }
        break;
  101ccf:	e9 98 00 00 00       	jmp    101d6c <trap_dispatch+0x103>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cd4:	e8 d1 f8 ff ff       	call   1015aa <cons_getc>
  101cd9:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cdc:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ce0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ce4:	83 ec 04             	sub    $0x4,%esp
  101ce7:	52                   	push   %edx
  101ce8:	50                   	push   %eax
  101ce9:	68 a9 39 10 00       	push   $0x1039a9
  101cee:	e8 4a e5 ff ff       	call   10023d <cprintf>
  101cf3:	83 c4 10             	add    $0x10,%esp
        break;
  101cf6:	eb 75                	jmp    101d6d <trap_dispatch+0x104>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cf8:	e8 ad f8 ff ff       	call   1015aa <cons_getc>
  101cfd:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d00:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d04:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d08:	83 ec 04             	sub    $0x4,%esp
  101d0b:	52                   	push   %edx
  101d0c:	50                   	push   %eax
  101d0d:	68 bb 39 10 00       	push   $0x1039bb
  101d12:	e8 26 e5 ff ff       	call   10023d <cprintf>
  101d17:	83 c4 10             	add    $0x10,%esp
        break;
  101d1a:	eb 51                	jmp    101d6d <trap_dispatch+0x104>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d1c:	83 ec 04             	sub    $0x4,%esp
  101d1f:	68 ca 39 10 00       	push   $0x1039ca
  101d24:	68 ae 00 00 00       	push   $0xae
  101d29:	68 ee 37 10 00       	push   $0x1037ee
  101d2e:	e8 70 e6 ff ff       	call   1003a3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d33:	8b 45 08             	mov    0x8(%ebp),%eax
  101d36:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d3a:	0f b7 c0             	movzwl %ax,%eax
  101d3d:	83 e0 03             	and    $0x3,%eax
  101d40:	85 c0                	test   %eax,%eax
  101d42:	75 29                	jne    101d6d <trap_dispatch+0x104>
            print_trapframe(tf);
  101d44:	83 ec 0c             	sub    $0xc,%esp
  101d47:	ff 75 08             	pushl  0x8(%ebp)
  101d4a:	e8 7d fc ff ff       	call   1019cc <print_trapframe>
  101d4f:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101d52:	83 ec 04             	sub    $0x4,%esp
  101d55:	68 da 39 10 00       	push   $0x1039da
  101d5a:	68 b8 00 00 00       	push   $0xb8
  101d5f:	68 ee 37 10 00       	push   $0x1037ee
  101d64:	e8 3a e6 ff ff       	call   1003a3 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d69:	90                   	nop
  101d6a:	eb 01                	jmp    101d6d <trap_dispatch+0x104>
	    ticks++;
	    if(ticks == 100) {
	    	ticks = 0;
	    	print_ticks();
	    }
        break;
  101d6c:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d6d:	90                   	nop
  101d6e:	c9                   	leave  
  101d6f:	c3                   	ret    

00101d70 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d70:	55                   	push   %ebp
  101d71:	89 e5                	mov    %esp,%ebp
  101d73:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d76:	83 ec 0c             	sub    $0xc,%esp
  101d79:	ff 75 08             	pushl  0x8(%ebp)
  101d7c:	e8 e8 fe ff ff       	call   101c69 <trap_dispatch>
  101d81:	83 c4 10             	add    $0x10,%esp
}
  101d84:	90                   	nop
  101d85:	c9                   	leave  
  101d86:	c3                   	ret    

00101d87 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d87:	6a 00                	push   $0x0
  pushl $0
  101d89:	6a 00                	push   $0x0
  jmp __alltraps
  101d8b:	e9 69 0a 00 00       	jmp    1027f9 <__alltraps>

00101d90 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d90:	6a 00                	push   $0x0
  pushl $1
  101d92:	6a 01                	push   $0x1
  jmp __alltraps
  101d94:	e9 60 0a 00 00       	jmp    1027f9 <__alltraps>

00101d99 <vector2>:
.globl vector2
vector2:
  pushl $0
  101d99:	6a 00                	push   $0x0
  pushl $2
  101d9b:	6a 02                	push   $0x2
  jmp __alltraps
  101d9d:	e9 57 0a 00 00       	jmp    1027f9 <__alltraps>

00101da2 <vector3>:
.globl vector3
vector3:
  pushl $0
  101da2:	6a 00                	push   $0x0
  pushl $3
  101da4:	6a 03                	push   $0x3
  jmp __alltraps
  101da6:	e9 4e 0a 00 00       	jmp    1027f9 <__alltraps>

00101dab <vector4>:
.globl vector4
vector4:
  pushl $0
  101dab:	6a 00                	push   $0x0
  pushl $4
  101dad:	6a 04                	push   $0x4
  jmp __alltraps
  101daf:	e9 45 0a 00 00       	jmp    1027f9 <__alltraps>

00101db4 <vector5>:
.globl vector5
vector5:
  pushl $0
  101db4:	6a 00                	push   $0x0
  pushl $5
  101db6:	6a 05                	push   $0x5
  jmp __alltraps
  101db8:	e9 3c 0a 00 00       	jmp    1027f9 <__alltraps>

00101dbd <vector6>:
.globl vector6
vector6:
  pushl $0
  101dbd:	6a 00                	push   $0x0
  pushl $6
  101dbf:	6a 06                	push   $0x6
  jmp __alltraps
  101dc1:	e9 33 0a 00 00       	jmp    1027f9 <__alltraps>

00101dc6 <vector7>:
.globl vector7
vector7:
  pushl $0
  101dc6:	6a 00                	push   $0x0
  pushl $7
  101dc8:	6a 07                	push   $0x7
  jmp __alltraps
  101dca:	e9 2a 0a 00 00       	jmp    1027f9 <__alltraps>

00101dcf <vector8>:
.globl vector8
vector8:
  pushl $8
  101dcf:	6a 08                	push   $0x8
  jmp __alltraps
  101dd1:	e9 23 0a 00 00       	jmp    1027f9 <__alltraps>

00101dd6 <vector9>:
.globl vector9
vector9:
  pushl $0
  101dd6:	6a 00                	push   $0x0
  pushl $9
  101dd8:	6a 09                	push   $0x9
  jmp __alltraps
  101dda:	e9 1a 0a 00 00       	jmp    1027f9 <__alltraps>

00101ddf <vector10>:
.globl vector10
vector10:
  pushl $10
  101ddf:	6a 0a                	push   $0xa
  jmp __alltraps
  101de1:	e9 13 0a 00 00       	jmp    1027f9 <__alltraps>

00101de6 <vector11>:
.globl vector11
vector11:
  pushl $11
  101de6:	6a 0b                	push   $0xb
  jmp __alltraps
  101de8:	e9 0c 0a 00 00       	jmp    1027f9 <__alltraps>

00101ded <vector12>:
.globl vector12
vector12:
  pushl $12
  101ded:	6a 0c                	push   $0xc
  jmp __alltraps
  101def:	e9 05 0a 00 00       	jmp    1027f9 <__alltraps>

00101df4 <vector13>:
.globl vector13
vector13:
  pushl $13
  101df4:	6a 0d                	push   $0xd
  jmp __alltraps
  101df6:	e9 fe 09 00 00       	jmp    1027f9 <__alltraps>

00101dfb <vector14>:
.globl vector14
vector14:
  pushl $14
  101dfb:	6a 0e                	push   $0xe
  jmp __alltraps
  101dfd:	e9 f7 09 00 00       	jmp    1027f9 <__alltraps>

00101e02 <vector15>:
.globl vector15
vector15:
  pushl $0
  101e02:	6a 00                	push   $0x0
  pushl $15
  101e04:	6a 0f                	push   $0xf
  jmp __alltraps
  101e06:	e9 ee 09 00 00       	jmp    1027f9 <__alltraps>

00101e0b <vector16>:
.globl vector16
vector16:
  pushl $0
  101e0b:	6a 00                	push   $0x0
  pushl $16
  101e0d:	6a 10                	push   $0x10
  jmp __alltraps
  101e0f:	e9 e5 09 00 00       	jmp    1027f9 <__alltraps>

00101e14 <vector17>:
.globl vector17
vector17:
  pushl $17
  101e14:	6a 11                	push   $0x11
  jmp __alltraps
  101e16:	e9 de 09 00 00       	jmp    1027f9 <__alltraps>

00101e1b <vector18>:
.globl vector18
vector18:
  pushl $0
  101e1b:	6a 00                	push   $0x0
  pushl $18
  101e1d:	6a 12                	push   $0x12
  jmp __alltraps
  101e1f:	e9 d5 09 00 00       	jmp    1027f9 <__alltraps>

00101e24 <vector19>:
.globl vector19
vector19:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $19
  101e26:	6a 13                	push   $0x13
  jmp __alltraps
  101e28:	e9 cc 09 00 00       	jmp    1027f9 <__alltraps>

00101e2d <vector20>:
.globl vector20
vector20:
  pushl $0
  101e2d:	6a 00                	push   $0x0
  pushl $20
  101e2f:	6a 14                	push   $0x14
  jmp __alltraps
  101e31:	e9 c3 09 00 00       	jmp    1027f9 <__alltraps>

00101e36 <vector21>:
.globl vector21
vector21:
  pushl $0
  101e36:	6a 00                	push   $0x0
  pushl $21
  101e38:	6a 15                	push   $0x15
  jmp __alltraps
  101e3a:	e9 ba 09 00 00       	jmp    1027f9 <__alltraps>

00101e3f <vector22>:
.globl vector22
vector22:
  pushl $0
  101e3f:	6a 00                	push   $0x0
  pushl $22
  101e41:	6a 16                	push   $0x16
  jmp __alltraps
  101e43:	e9 b1 09 00 00       	jmp    1027f9 <__alltraps>

00101e48 <vector23>:
.globl vector23
vector23:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $23
  101e4a:	6a 17                	push   $0x17
  jmp __alltraps
  101e4c:	e9 a8 09 00 00       	jmp    1027f9 <__alltraps>

00101e51 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e51:	6a 00                	push   $0x0
  pushl $24
  101e53:	6a 18                	push   $0x18
  jmp __alltraps
  101e55:	e9 9f 09 00 00       	jmp    1027f9 <__alltraps>

00101e5a <vector25>:
.globl vector25
vector25:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $25
  101e5c:	6a 19                	push   $0x19
  jmp __alltraps
  101e5e:	e9 96 09 00 00       	jmp    1027f9 <__alltraps>

00101e63 <vector26>:
.globl vector26
vector26:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $26
  101e65:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e67:	e9 8d 09 00 00       	jmp    1027f9 <__alltraps>

00101e6c <vector27>:
.globl vector27
vector27:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $27
  101e6e:	6a 1b                	push   $0x1b
  jmp __alltraps
  101e70:	e9 84 09 00 00       	jmp    1027f9 <__alltraps>

00101e75 <vector28>:
.globl vector28
vector28:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $28
  101e77:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e79:	e9 7b 09 00 00       	jmp    1027f9 <__alltraps>

00101e7e <vector29>:
.globl vector29
vector29:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $29
  101e80:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e82:	e9 72 09 00 00       	jmp    1027f9 <__alltraps>

00101e87 <vector30>:
.globl vector30
vector30:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $30
  101e89:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e8b:	e9 69 09 00 00       	jmp    1027f9 <__alltraps>

00101e90 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $31
  101e92:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e94:	e9 60 09 00 00       	jmp    1027f9 <__alltraps>

00101e99 <vector32>:
.globl vector32
vector32:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $32
  101e9b:	6a 20                	push   $0x20
  jmp __alltraps
  101e9d:	e9 57 09 00 00       	jmp    1027f9 <__alltraps>

00101ea2 <vector33>:
.globl vector33
vector33:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $33
  101ea4:	6a 21                	push   $0x21
  jmp __alltraps
  101ea6:	e9 4e 09 00 00       	jmp    1027f9 <__alltraps>

00101eab <vector34>:
.globl vector34
vector34:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $34
  101ead:	6a 22                	push   $0x22
  jmp __alltraps
  101eaf:	e9 45 09 00 00       	jmp    1027f9 <__alltraps>

00101eb4 <vector35>:
.globl vector35
vector35:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $35
  101eb6:	6a 23                	push   $0x23
  jmp __alltraps
  101eb8:	e9 3c 09 00 00       	jmp    1027f9 <__alltraps>

00101ebd <vector36>:
.globl vector36
vector36:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $36
  101ebf:	6a 24                	push   $0x24
  jmp __alltraps
  101ec1:	e9 33 09 00 00       	jmp    1027f9 <__alltraps>

00101ec6 <vector37>:
.globl vector37
vector37:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $37
  101ec8:	6a 25                	push   $0x25
  jmp __alltraps
  101eca:	e9 2a 09 00 00       	jmp    1027f9 <__alltraps>

00101ecf <vector38>:
.globl vector38
vector38:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $38
  101ed1:	6a 26                	push   $0x26
  jmp __alltraps
  101ed3:	e9 21 09 00 00       	jmp    1027f9 <__alltraps>

00101ed8 <vector39>:
.globl vector39
vector39:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $39
  101eda:	6a 27                	push   $0x27
  jmp __alltraps
  101edc:	e9 18 09 00 00       	jmp    1027f9 <__alltraps>

00101ee1 <vector40>:
.globl vector40
vector40:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $40
  101ee3:	6a 28                	push   $0x28
  jmp __alltraps
  101ee5:	e9 0f 09 00 00       	jmp    1027f9 <__alltraps>

00101eea <vector41>:
.globl vector41
vector41:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $41
  101eec:	6a 29                	push   $0x29
  jmp __alltraps
  101eee:	e9 06 09 00 00       	jmp    1027f9 <__alltraps>

00101ef3 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $42
  101ef5:	6a 2a                	push   $0x2a
  jmp __alltraps
  101ef7:	e9 fd 08 00 00       	jmp    1027f9 <__alltraps>

00101efc <vector43>:
.globl vector43
vector43:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $43
  101efe:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f00:	e9 f4 08 00 00       	jmp    1027f9 <__alltraps>

00101f05 <vector44>:
.globl vector44
vector44:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $44
  101f07:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f09:	e9 eb 08 00 00       	jmp    1027f9 <__alltraps>

00101f0e <vector45>:
.globl vector45
vector45:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $45
  101f10:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f12:	e9 e2 08 00 00       	jmp    1027f9 <__alltraps>

00101f17 <vector46>:
.globl vector46
vector46:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $46
  101f19:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f1b:	e9 d9 08 00 00       	jmp    1027f9 <__alltraps>

00101f20 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $47
  101f22:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f24:	e9 d0 08 00 00       	jmp    1027f9 <__alltraps>

00101f29 <vector48>:
.globl vector48
vector48:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $48
  101f2b:	6a 30                	push   $0x30
  jmp __alltraps
  101f2d:	e9 c7 08 00 00       	jmp    1027f9 <__alltraps>

00101f32 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $49
  101f34:	6a 31                	push   $0x31
  jmp __alltraps
  101f36:	e9 be 08 00 00       	jmp    1027f9 <__alltraps>

00101f3b <vector50>:
.globl vector50
vector50:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $50
  101f3d:	6a 32                	push   $0x32
  jmp __alltraps
  101f3f:	e9 b5 08 00 00       	jmp    1027f9 <__alltraps>

00101f44 <vector51>:
.globl vector51
vector51:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $51
  101f46:	6a 33                	push   $0x33
  jmp __alltraps
  101f48:	e9 ac 08 00 00       	jmp    1027f9 <__alltraps>

00101f4d <vector52>:
.globl vector52
vector52:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $52
  101f4f:	6a 34                	push   $0x34
  jmp __alltraps
  101f51:	e9 a3 08 00 00       	jmp    1027f9 <__alltraps>

00101f56 <vector53>:
.globl vector53
vector53:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $53
  101f58:	6a 35                	push   $0x35
  jmp __alltraps
  101f5a:	e9 9a 08 00 00       	jmp    1027f9 <__alltraps>

00101f5f <vector54>:
.globl vector54
vector54:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $54
  101f61:	6a 36                	push   $0x36
  jmp __alltraps
  101f63:	e9 91 08 00 00       	jmp    1027f9 <__alltraps>

00101f68 <vector55>:
.globl vector55
vector55:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $55
  101f6a:	6a 37                	push   $0x37
  jmp __alltraps
  101f6c:	e9 88 08 00 00       	jmp    1027f9 <__alltraps>

00101f71 <vector56>:
.globl vector56
vector56:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $56
  101f73:	6a 38                	push   $0x38
  jmp __alltraps
  101f75:	e9 7f 08 00 00       	jmp    1027f9 <__alltraps>

00101f7a <vector57>:
.globl vector57
vector57:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $57
  101f7c:	6a 39                	push   $0x39
  jmp __alltraps
  101f7e:	e9 76 08 00 00       	jmp    1027f9 <__alltraps>

00101f83 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $58
  101f85:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f87:	e9 6d 08 00 00       	jmp    1027f9 <__alltraps>

00101f8c <vector59>:
.globl vector59
vector59:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $59
  101f8e:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f90:	e9 64 08 00 00       	jmp    1027f9 <__alltraps>

00101f95 <vector60>:
.globl vector60
vector60:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $60
  101f97:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f99:	e9 5b 08 00 00       	jmp    1027f9 <__alltraps>

00101f9e <vector61>:
.globl vector61
vector61:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $61
  101fa0:	6a 3d                	push   $0x3d
  jmp __alltraps
  101fa2:	e9 52 08 00 00       	jmp    1027f9 <__alltraps>

00101fa7 <vector62>:
.globl vector62
vector62:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $62
  101fa9:	6a 3e                	push   $0x3e
  jmp __alltraps
  101fab:	e9 49 08 00 00       	jmp    1027f9 <__alltraps>

00101fb0 <vector63>:
.globl vector63
vector63:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $63
  101fb2:	6a 3f                	push   $0x3f
  jmp __alltraps
  101fb4:	e9 40 08 00 00       	jmp    1027f9 <__alltraps>

00101fb9 <vector64>:
.globl vector64
vector64:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $64
  101fbb:	6a 40                	push   $0x40
  jmp __alltraps
  101fbd:	e9 37 08 00 00       	jmp    1027f9 <__alltraps>

00101fc2 <vector65>:
.globl vector65
vector65:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $65
  101fc4:	6a 41                	push   $0x41
  jmp __alltraps
  101fc6:	e9 2e 08 00 00       	jmp    1027f9 <__alltraps>

00101fcb <vector66>:
.globl vector66
vector66:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $66
  101fcd:	6a 42                	push   $0x42
  jmp __alltraps
  101fcf:	e9 25 08 00 00       	jmp    1027f9 <__alltraps>

00101fd4 <vector67>:
.globl vector67
vector67:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $67
  101fd6:	6a 43                	push   $0x43
  jmp __alltraps
  101fd8:	e9 1c 08 00 00       	jmp    1027f9 <__alltraps>

00101fdd <vector68>:
.globl vector68
vector68:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $68
  101fdf:	6a 44                	push   $0x44
  jmp __alltraps
  101fe1:	e9 13 08 00 00       	jmp    1027f9 <__alltraps>

00101fe6 <vector69>:
.globl vector69
vector69:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $69
  101fe8:	6a 45                	push   $0x45
  jmp __alltraps
  101fea:	e9 0a 08 00 00       	jmp    1027f9 <__alltraps>

00101fef <vector70>:
.globl vector70
vector70:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $70
  101ff1:	6a 46                	push   $0x46
  jmp __alltraps
  101ff3:	e9 01 08 00 00       	jmp    1027f9 <__alltraps>

00101ff8 <vector71>:
.globl vector71
vector71:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $71
  101ffa:	6a 47                	push   $0x47
  jmp __alltraps
  101ffc:	e9 f8 07 00 00       	jmp    1027f9 <__alltraps>

00102001 <vector72>:
.globl vector72
vector72:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $72
  102003:	6a 48                	push   $0x48
  jmp __alltraps
  102005:	e9 ef 07 00 00       	jmp    1027f9 <__alltraps>

0010200a <vector73>:
.globl vector73
vector73:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $73
  10200c:	6a 49                	push   $0x49
  jmp __alltraps
  10200e:	e9 e6 07 00 00       	jmp    1027f9 <__alltraps>

00102013 <vector74>:
.globl vector74
vector74:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $74
  102015:	6a 4a                	push   $0x4a
  jmp __alltraps
  102017:	e9 dd 07 00 00       	jmp    1027f9 <__alltraps>

0010201c <vector75>:
.globl vector75
vector75:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $75
  10201e:	6a 4b                	push   $0x4b
  jmp __alltraps
  102020:	e9 d4 07 00 00       	jmp    1027f9 <__alltraps>

00102025 <vector76>:
.globl vector76
vector76:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $76
  102027:	6a 4c                	push   $0x4c
  jmp __alltraps
  102029:	e9 cb 07 00 00       	jmp    1027f9 <__alltraps>

0010202e <vector77>:
.globl vector77
vector77:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $77
  102030:	6a 4d                	push   $0x4d
  jmp __alltraps
  102032:	e9 c2 07 00 00       	jmp    1027f9 <__alltraps>

00102037 <vector78>:
.globl vector78
vector78:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $78
  102039:	6a 4e                	push   $0x4e
  jmp __alltraps
  10203b:	e9 b9 07 00 00       	jmp    1027f9 <__alltraps>

00102040 <vector79>:
.globl vector79
vector79:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $79
  102042:	6a 4f                	push   $0x4f
  jmp __alltraps
  102044:	e9 b0 07 00 00       	jmp    1027f9 <__alltraps>

00102049 <vector80>:
.globl vector80
vector80:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $80
  10204b:	6a 50                	push   $0x50
  jmp __alltraps
  10204d:	e9 a7 07 00 00       	jmp    1027f9 <__alltraps>

00102052 <vector81>:
.globl vector81
vector81:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $81
  102054:	6a 51                	push   $0x51
  jmp __alltraps
  102056:	e9 9e 07 00 00       	jmp    1027f9 <__alltraps>

0010205b <vector82>:
.globl vector82
vector82:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $82
  10205d:	6a 52                	push   $0x52
  jmp __alltraps
  10205f:	e9 95 07 00 00       	jmp    1027f9 <__alltraps>

00102064 <vector83>:
.globl vector83
vector83:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $83
  102066:	6a 53                	push   $0x53
  jmp __alltraps
  102068:	e9 8c 07 00 00       	jmp    1027f9 <__alltraps>

0010206d <vector84>:
.globl vector84
vector84:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $84
  10206f:	6a 54                	push   $0x54
  jmp __alltraps
  102071:	e9 83 07 00 00       	jmp    1027f9 <__alltraps>

00102076 <vector85>:
.globl vector85
vector85:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $85
  102078:	6a 55                	push   $0x55
  jmp __alltraps
  10207a:	e9 7a 07 00 00       	jmp    1027f9 <__alltraps>

0010207f <vector86>:
.globl vector86
vector86:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $86
  102081:	6a 56                	push   $0x56
  jmp __alltraps
  102083:	e9 71 07 00 00       	jmp    1027f9 <__alltraps>

00102088 <vector87>:
.globl vector87
vector87:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $87
  10208a:	6a 57                	push   $0x57
  jmp __alltraps
  10208c:	e9 68 07 00 00       	jmp    1027f9 <__alltraps>

00102091 <vector88>:
.globl vector88
vector88:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $88
  102093:	6a 58                	push   $0x58
  jmp __alltraps
  102095:	e9 5f 07 00 00       	jmp    1027f9 <__alltraps>

0010209a <vector89>:
.globl vector89
vector89:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $89
  10209c:	6a 59                	push   $0x59
  jmp __alltraps
  10209e:	e9 56 07 00 00       	jmp    1027f9 <__alltraps>

001020a3 <vector90>:
.globl vector90
vector90:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $90
  1020a5:	6a 5a                	push   $0x5a
  jmp __alltraps
  1020a7:	e9 4d 07 00 00       	jmp    1027f9 <__alltraps>

001020ac <vector91>:
.globl vector91
vector91:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $91
  1020ae:	6a 5b                	push   $0x5b
  jmp __alltraps
  1020b0:	e9 44 07 00 00       	jmp    1027f9 <__alltraps>

001020b5 <vector92>:
.globl vector92
vector92:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $92
  1020b7:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020b9:	e9 3b 07 00 00       	jmp    1027f9 <__alltraps>

001020be <vector93>:
.globl vector93
vector93:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $93
  1020c0:	6a 5d                	push   $0x5d
  jmp __alltraps
  1020c2:	e9 32 07 00 00       	jmp    1027f9 <__alltraps>

001020c7 <vector94>:
.globl vector94
vector94:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $94
  1020c9:	6a 5e                	push   $0x5e
  jmp __alltraps
  1020cb:	e9 29 07 00 00       	jmp    1027f9 <__alltraps>

001020d0 <vector95>:
.globl vector95
vector95:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $95
  1020d2:	6a 5f                	push   $0x5f
  jmp __alltraps
  1020d4:	e9 20 07 00 00       	jmp    1027f9 <__alltraps>

001020d9 <vector96>:
.globl vector96
vector96:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $96
  1020db:	6a 60                	push   $0x60
  jmp __alltraps
  1020dd:	e9 17 07 00 00       	jmp    1027f9 <__alltraps>

001020e2 <vector97>:
.globl vector97
vector97:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $97
  1020e4:	6a 61                	push   $0x61
  jmp __alltraps
  1020e6:	e9 0e 07 00 00       	jmp    1027f9 <__alltraps>

001020eb <vector98>:
.globl vector98
vector98:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $98
  1020ed:	6a 62                	push   $0x62
  jmp __alltraps
  1020ef:	e9 05 07 00 00       	jmp    1027f9 <__alltraps>

001020f4 <vector99>:
.globl vector99
vector99:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $99
  1020f6:	6a 63                	push   $0x63
  jmp __alltraps
  1020f8:	e9 fc 06 00 00       	jmp    1027f9 <__alltraps>

001020fd <vector100>:
.globl vector100
vector100:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $100
  1020ff:	6a 64                	push   $0x64
  jmp __alltraps
  102101:	e9 f3 06 00 00       	jmp    1027f9 <__alltraps>

00102106 <vector101>:
.globl vector101
vector101:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $101
  102108:	6a 65                	push   $0x65
  jmp __alltraps
  10210a:	e9 ea 06 00 00       	jmp    1027f9 <__alltraps>

0010210f <vector102>:
.globl vector102
vector102:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $102
  102111:	6a 66                	push   $0x66
  jmp __alltraps
  102113:	e9 e1 06 00 00       	jmp    1027f9 <__alltraps>

00102118 <vector103>:
.globl vector103
vector103:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $103
  10211a:	6a 67                	push   $0x67
  jmp __alltraps
  10211c:	e9 d8 06 00 00       	jmp    1027f9 <__alltraps>

00102121 <vector104>:
.globl vector104
vector104:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $104
  102123:	6a 68                	push   $0x68
  jmp __alltraps
  102125:	e9 cf 06 00 00       	jmp    1027f9 <__alltraps>

0010212a <vector105>:
.globl vector105
vector105:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $105
  10212c:	6a 69                	push   $0x69
  jmp __alltraps
  10212e:	e9 c6 06 00 00       	jmp    1027f9 <__alltraps>

00102133 <vector106>:
.globl vector106
vector106:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $106
  102135:	6a 6a                	push   $0x6a
  jmp __alltraps
  102137:	e9 bd 06 00 00       	jmp    1027f9 <__alltraps>

0010213c <vector107>:
.globl vector107
vector107:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $107
  10213e:	6a 6b                	push   $0x6b
  jmp __alltraps
  102140:	e9 b4 06 00 00       	jmp    1027f9 <__alltraps>

00102145 <vector108>:
.globl vector108
vector108:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $108
  102147:	6a 6c                	push   $0x6c
  jmp __alltraps
  102149:	e9 ab 06 00 00       	jmp    1027f9 <__alltraps>

0010214e <vector109>:
.globl vector109
vector109:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $109
  102150:	6a 6d                	push   $0x6d
  jmp __alltraps
  102152:	e9 a2 06 00 00       	jmp    1027f9 <__alltraps>

00102157 <vector110>:
.globl vector110
vector110:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $110
  102159:	6a 6e                	push   $0x6e
  jmp __alltraps
  10215b:	e9 99 06 00 00       	jmp    1027f9 <__alltraps>

00102160 <vector111>:
.globl vector111
vector111:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $111
  102162:	6a 6f                	push   $0x6f
  jmp __alltraps
  102164:	e9 90 06 00 00       	jmp    1027f9 <__alltraps>

00102169 <vector112>:
.globl vector112
vector112:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $112
  10216b:	6a 70                	push   $0x70
  jmp __alltraps
  10216d:	e9 87 06 00 00       	jmp    1027f9 <__alltraps>

00102172 <vector113>:
.globl vector113
vector113:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $113
  102174:	6a 71                	push   $0x71
  jmp __alltraps
  102176:	e9 7e 06 00 00       	jmp    1027f9 <__alltraps>

0010217b <vector114>:
.globl vector114
vector114:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $114
  10217d:	6a 72                	push   $0x72
  jmp __alltraps
  10217f:	e9 75 06 00 00       	jmp    1027f9 <__alltraps>

00102184 <vector115>:
.globl vector115
vector115:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $115
  102186:	6a 73                	push   $0x73
  jmp __alltraps
  102188:	e9 6c 06 00 00       	jmp    1027f9 <__alltraps>

0010218d <vector116>:
.globl vector116
vector116:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $116
  10218f:	6a 74                	push   $0x74
  jmp __alltraps
  102191:	e9 63 06 00 00       	jmp    1027f9 <__alltraps>

00102196 <vector117>:
.globl vector117
vector117:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $117
  102198:	6a 75                	push   $0x75
  jmp __alltraps
  10219a:	e9 5a 06 00 00       	jmp    1027f9 <__alltraps>

0010219f <vector118>:
.globl vector118
vector118:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $118
  1021a1:	6a 76                	push   $0x76
  jmp __alltraps
  1021a3:	e9 51 06 00 00       	jmp    1027f9 <__alltraps>

001021a8 <vector119>:
.globl vector119
vector119:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $119
  1021aa:	6a 77                	push   $0x77
  jmp __alltraps
  1021ac:	e9 48 06 00 00       	jmp    1027f9 <__alltraps>

001021b1 <vector120>:
.globl vector120
vector120:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $120
  1021b3:	6a 78                	push   $0x78
  jmp __alltraps
  1021b5:	e9 3f 06 00 00       	jmp    1027f9 <__alltraps>

001021ba <vector121>:
.globl vector121
vector121:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $121
  1021bc:	6a 79                	push   $0x79
  jmp __alltraps
  1021be:	e9 36 06 00 00       	jmp    1027f9 <__alltraps>

001021c3 <vector122>:
.globl vector122
vector122:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $122
  1021c5:	6a 7a                	push   $0x7a
  jmp __alltraps
  1021c7:	e9 2d 06 00 00       	jmp    1027f9 <__alltraps>

001021cc <vector123>:
.globl vector123
vector123:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $123
  1021ce:	6a 7b                	push   $0x7b
  jmp __alltraps
  1021d0:	e9 24 06 00 00       	jmp    1027f9 <__alltraps>

001021d5 <vector124>:
.globl vector124
vector124:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $124
  1021d7:	6a 7c                	push   $0x7c
  jmp __alltraps
  1021d9:	e9 1b 06 00 00       	jmp    1027f9 <__alltraps>

001021de <vector125>:
.globl vector125
vector125:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $125
  1021e0:	6a 7d                	push   $0x7d
  jmp __alltraps
  1021e2:	e9 12 06 00 00       	jmp    1027f9 <__alltraps>

001021e7 <vector126>:
.globl vector126
vector126:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $126
  1021e9:	6a 7e                	push   $0x7e
  jmp __alltraps
  1021eb:	e9 09 06 00 00       	jmp    1027f9 <__alltraps>

001021f0 <vector127>:
.globl vector127
vector127:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $127
  1021f2:	6a 7f                	push   $0x7f
  jmp __alltraps
  1021f4:	e9 00 06 00 00       	jmp    1027f9 <__alltraps>

001021f9 <vector128>:
.globl vector128
vector128:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $128
  1021fb:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102200:	e9 f4 05 00 00       	jmp    1027f9 <__alltraps>

00102205 <vector129>:
.globl vector129
vector129:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $129
  102207:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10220c:	e9 e8 05 00 00       	jmp    1027f9 <__alltraps>

00102211 <vector130>:
.globl vector130
vector130:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $130
  102213:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102218:	e9 dc 05 00 00       	jmp    1027f9 <__alltraps>

0010221d <vector131>:
.globl vector131
vector131:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $131
  10221f:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102224:	e9 d0 05 00 00       	jmp    1027f9 <__alltraps>

00102229 <vector132>:
.globl vector132
vector132:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $132
  10222b:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102230:	e9 c4 05 00 00       	jmp    1027f9 <__alltraps>

00102235 <vector133>:
.globl vector133
vector133:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $133
  102237:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10223c:	e9 b8 05 00 00       	jmp    1027f9 <__alltraps>

00102241 <vector134>:
.globl vector134
vector134:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $134
  102243:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102248:	e9 ac 05 00 00       	jmp    1027f9 <__alltraps>

0010224d <vector135>:
.globl vector135
vector135:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $135
  10224f:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102254:	e9 a0 05 00 00       	jmp    1027f9 <__alltraps>

00102259 <vector136>:
.globl vector136
vector136:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $136
  10225b:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102260:	e9 94 05 00 00       	jmp    1027f9 <__alltraps>

00102265 <vector137>:
.globl vector137
vector137:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $137
  102267:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10226c:	e9 88 05 00 00       	jmp    1027f9 <__alltraps>

00102271 <vector138>:
.globl vector138
vector138:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $138
  102273:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102278:	e9 7c 05 00 00       	jmp    1027f9 <__alltraps>

0010227d <vector139>:
.globl vector139
vector139:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $139
  10227f:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102284:	e9 70 05 00 00       	jmp    1027f9 <__alltraps>

00102289 <vector140>:
.globl vector140
vector140:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $140
  10228b:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102290:	e9 64 05 00 00       	jmp    1027f9 <__alltraps>

00102295 <vector141>:
.globl vector141
vector141:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $141
  102297:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10229c:	e9 58 05 00 00       	jmp    1027f9 <__alltraps>

001022a1 <vector142>:
.globl vector142
vector142:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $142
  1022a3:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1022a8:	e9 4c 05 00 00       	jmp    1027f9 <__alltraps>

001022ad <vector143>:
.globl vector143
vector143:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $143
  1022af:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1022b4:	e9 40 05 00 00       	jmp    1027f9 <__alltraps>

001022b9 <vector144>:
.globl vector144
vector144:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $144
  1022bb:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022c0:	e9 34 05 00 00       	jmp    1027f9 <__alltraps>

001022c5 <vector145>:
.globl vector145
vector145:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $145
  1022c7:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1022cc:	e9 28 05 00 00       	jmp    1027f9 <__alltraps>

001022d1 <vector146>:
.globl vector146
vector146:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $146
  1022d3:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1022d8:	e9 1c 05 00 00       	jmp    1027f9 <__alltraps>

001022dd <vector147>:
.globl vector147
vector147:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $147
  1022df:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1022e4:	e9 10 05 00 00       	jmp    1027f9 <__alltraps>

001022e9 <vector148>:
.globl vector148
vector148:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $148
  1022eb:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1022f0:	e9 04 05 00 00       	jmp    1027f9 <__alltraps>

001022f5 <vector149>:
.globl vector149
vector149:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $149
  1022f7:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1022fc:	e9 f8 04 00 00       	jmp    1027f9 <__alltraps>

00102301 <vector150>:
.globl vector150
vector150:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $150
  102303:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102308:	e9 ec 04 00 00       	jmp    1027f9 <__alltraps>

0010230d <vector151>:
.globl vector151
vector151:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $151
  10230f:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102314:	e9 e0 04 00 00       	jmp    1027f9 <__alltraps>

00102319 <vector152>:
.globl vector152
vector152:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $152
  10231b:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102320:	e9 d4 04 00 00       	jmp    1027f9 <__alltraps>

00102325 <vector153>:
.globl vector153
vector153:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $153
  102327:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10232c:	e9 c8 04 00 00       	jmp    1027f9 <__alltraps>

00102331 <vector154>:
.globl vector154
vector154:
  pushl $0
  102331:	6a 00                	push   $0x0
  pushl $154
  102333:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102338:	e9 bc 04 00 00       	jmp    1027f9 <__alltraps>

0010233d <vector155>:
.globl vector155
vector155:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $155
  10233f:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102344:	e9 b0 04 00 00       	jmp    1027f9 <__alltraps>

00102349 <vector156>:
.globl vector156
vector156:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $156
  10234b:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102350:	e9 a4 04 00 00       	jmp    1027f9 <__alltraps>

00102355 <vector157>:
.globl vector157
vector157:
  pushl $0
  102355:	6a 00                	push   $0x0
  pushl $157
  102357:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10235c:	e9 98 04 00 00       	jmp    1027f9 <__alltraps>

00102361 <vector158>:
.globl vector158
vector158:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $158
  102363:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102368:	e9 8c 04 00 00       	jmp    1027f9 <__alltraps>

0010236d <vector159>:
.globl vector159
vector159:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $159
  10236f:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102374:	e9 80 04 00 00       	jmp    1027f9 <__alltraps>

00102379 <vector160>:
.globl vector160
vector160:
  pushl $0
  102379:	6a 00                	push   $0x0
  pushl $160
  10237b:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102380:	e9 74 04 00 00       	jmp    1027f9 <__alltraps>

00102385 <vector161>:
.globl vector161
vector161:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $161
  102387:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10238c:	e9 68 04 00 00       	jmp    1027f9 <__alltraps>

00102391 <vector162>:
.globl vector162
vector162:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $162
  102393:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102398:	e9 5c 04 00 00       	jmp    1027f9 <__alltraps>

0010239d <vector163>:
.globl vector163
vector163:
  pushl $0
  10239d:	6a 00                	push   $0x0
  pushl $163
  10239f:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1023a4:	e9 50 04 00 00       	jmp    1027f9 <__alltraps>

001023a9 <vector164>:
.globl vector164
vector164:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $164
  1023ab:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1023b0:	e9 44 04 00 00       	jmp    1027f9 <__alltraps>

001023b5 <vector165>:
.globl vector165
vector165:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $165
  1023b7:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023bc:	e9 38 04 00 00       	jmp    1027f9 <__alltraps>

001023c1 <vector166>:
.globl vector166
vector166:
  pushl $0
  1023c1:	6a 00                	push   $0x0
  pushl $166
  1023c3:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1023c8:	e9 2c 04 00 00       	jmp    1027f9 <__alltraps>

001023cd <vector167>:
.globl vector167
vector167:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $167
  1023cf:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1023d4:	e9 20 04 00 00       	jmp    1027f9 <__alltraps>

001023d9 <vector168>:
.globl vector168
vector168:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $168
  1023db:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1023e0:	e9 14 04 00 00       	jmp    1027f9 <__alltraps>

001023e5 <vector169>:
.globl vector169
vector169:
  pushl $0
  1023e5:	6a 00                	push   $0x0
  pushl $169
  1023e7:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1023ec:	e9 08 04 00 00       	jmp    1027f9 <__alltraps>

001023f1 <vector170>:
.globl vector170
vector170:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $170
  1023f3:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1023f8:	e9 fc 03 00 00       	jmp    1027f9 <__alltraps>

001023fd <vector171>:
.globl vector171
vector171:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $171
  1023ff:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102404:	e9 f0 03 00 00       	jmp    1027f9 <__alltraps>

00102409 <vector172>:
.globl vector172
vector172:
  pushl $0
  102409:	6a 00                	push   $0x0
  pushl $172
  10240b:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102410:	e9 e4 03 00 00       	jmp    1027f9 <__alltraps>

00102415 <vector173>:
.globl vector173
vector173:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $173
  102417:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10241c:	e9 d8 03 00 00       	jmp    1027f9 <__alltraps>

00102421 <vector174>:
.globl vector174
vector174:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $174
  102423:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102428:	e9 cc 03 00 00       	jmp    1027f9 <__alltraps>

0010242d <vector175>:
.globl vector175
vector175:
  pushl $0
  10242d:	6a 00                	push   $0x0
  pushl $175
  10242f:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102434:	e9 c0 03 00 00       	jmp    1027f9 <__alltraps>

00102439 <vector176>:
.globl vector176
vector176:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $176
  10243b:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102440:	e9 b4 03 00 00       	jmp    1027f9 <__alltraps>

00102445 <vector177>:
.globl vector177
vector177:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $177
  102447:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10244c:	e9 a8 03 00 00       	jmp    1027f9 <__alltraps>

00102451 <vector178>:
.globl vector178
vector178:
  pushl $0
  102451:	6a 00                	push   $0x0
  pushl $178
  102453:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102458:	e9 9c 03 00 00       	jmp    1027f9 <__alltraps>

0010245d <vector179>:
.globl vector179
vector179:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $179
  10245f:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102464:	e9 90 03 00 00       	jmp    1027f9 <__alltraps>

00102469 <vector180>:
.globl vector180
vector180:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $180
  10246b:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102470:	e9 84 03 00 00       	jmp    1027f9 <__alltraps>

00102475 <vector181>:
.globl vector181
vector181:
  pushl $0
  102475:	6a 00                	push   $0x0
  pushl $181
  102477:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10247c:	e9 78 03 00 00       	jmp    1027f9 <__alltraps>

00102481 <vector182>:
.globl vector182
vector182:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $182
  102483:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102488:	e9 6c 03 00 00       	jmp    1027f9 <__alltraps>

0010248d <vector183>:
.globl vector183
vector183:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $183
  10248f:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102494:	e9 60 03 00 00       	jmp    1027f9 <__alltraps>

00102499 <vector184>:
.globl vector184
vector184:
  pushl $0
  102499:	6a 00                	push   $0x0
  pushl $184
  10249b:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1024a0:	e9 54 03 00 00       	jmp    1027f9 <__alltraps>

001024a5 <vector185>:
.globl vector185
vector185:
  pushl $0
  1024a5:	6a 00                	push   $0x0
  pushl $185
  1024a7:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1024ac:	e9 48 03 00 00       	jmp    1027f9 <__alltraps>

001024b1 <vector186>:
.globl vector186
vector186:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $186
  1024b3:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024b8:	e9 3c 03 00 00       	jmp    1027f9 <__alltraps>

001024bd <vector187>:
.globl vector187
vector187:
  pushl $0
  1024bd:	6a 00                	push   $0x0
  pushl $187
  1024bf:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1024c4:	e9 30 03 00 00       	jmp    1027f9 <__alltraps>

001024c9 <vector188>:
.globl vector188
vector188:
  pushl $0
  1024c9:	6a 00                	push   $0x0
  pushl $188
  1024cb:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1024d0:	e9 24 03 00 00       	jmp    1027f9 <__alltraps>

001024d5 <vector189>:
.globl vector189
vector189:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $189
  1024d7:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1024dc:	e9 18 03 00 00       	jmp    1027f9 <__alltraps>

001024e1 <vector190>:
.globl vector190
vector190:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $190
  1024e3:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1024e8:	e9 0c 03 00 00       	jmp    1027f9 <__alltraps>

001024ed <vector191>:
.globl vector191
vector191:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $191
  1024ef:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1024f4:	e9 00 03 00 00       	jmp    1027f9 <__alltraps>

001024f9 <vector192>:
.globl vector192
vector192:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $192
  1024fb:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102500:	e9 f4 02 00 00       	jmp    1027f9 <__alltraps>

00102505 <vector193>:
.globl vector193
vector193:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $193
  102507:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10250c:	e9 e8 02 00 00       	jmp    1027f9 <__alltraps>

00102511 <vector194>:
.globl vector194
vector194:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $194
  102513:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102518:	e9 dc 02 00 00       	jmp    1027f9 <__alltraps>

0010251d <vector195>:
.globl vector195
vector195:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $195
  10251f:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102524:	e9 d0 02 00 00       	jmp    1027f9 <__alltraps>

00102529 <vector196>:
.globl vector196
vector196:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $196
  10252b:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102530:	e9 c4 02 00 00       	jmp    1027f9 <__alltraps>

00102535 <vector197>:
.globl vector197
vector197:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $197
  102537:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10253c:	e9 b8 02 00 00       	jmp    1027f9 <__alltraps>

00102541 <vector198>:
.globl vector198
vector198:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $198
  102543:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102548:	e9 ac 02 00 00       	jmp    1027f9 <__alltraps>

0010254d <vector199>:
.globl vector199
vector199:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $199
  10254f:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102554:	e9 a0 02 00 00       	jmp    1027f9 <__alltraps>

00102559 <vector200>:
.globl vector200
vector200:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $200
  10255b:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102560:	e9 94 02 00 00       	jmp    1027f9 <__alltraps>

00102565 <vector201>:
.globl vector201
vector201:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $201
  102567:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10256c:	e9 88 02 00 00       	jmp    1027f9 <__alltraps>

00102571 <vector202>:
.globl vector202
vector202:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $202
  102573:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102578:	e9 7c 02 00 00       	jmp    1027f9 <__alltraps>

0010257d <vector203>:
.globl vector203
vector203:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $203
  10257f:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102584:	e9 70 02 00 00       	jmp    1027f9 <__alltraps>

00102589 <vector204>:
.globl vector204
vector204:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $204
  10258b:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102590:	e9 64 02 00 00       	jmp    1027f9 <__alltraps>

00102595 <vector205>:
.globl vector205
vector205:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $205
  102597:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10259c:	e9 58 02 00 00       	jmp    1027f9 <__alltraps>

001025a1 <vector206>:
.globl vector206
vector206:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $206
  1025a3:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1025a8:	e9 4c 02 00 00       	jmp    1027f9 <__alltraps>

001025ad <vector207>:
.globl vector207
vector207:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $207
  1025af:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1025b4:	e9 40 02 00 00       	jmp    1027f9 <__alltraps>

001025b9 <vector208>:
.globl vector208
vector208:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $208
  1025bb:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025c0:	e9 34 02 00 00       	jmp    1027f9 <__alltraps>

001025c5 <vector209>:
.globl vector209
vector209:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $209
  1025c7:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1025cc:	e9 28 02 00 00       	jmp    1027f9 <__alltraps>

001025d1 <vector210>:
.globl vector210
vector210:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $210
  1025d3:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1025d8:	e9 1c 02 00 00       	jmp    1027f9 <__alltraps>

001025dd <vector211>:
.globl vector211
vector211:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $211
  1025df:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1025e4:	e9 10 02 00 00       	jmp    1027f9 <__alltraps>

001025e9 <vector212>:
.globl vector212
vector212:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $212
  1025eb:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1025f0:	e9 04 02 00 00       	jmp    1027f9 <__alltraps>

001025f5 <vector213>:
.globl vector213
vector213:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $213
  1025f7:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1025fc:	e9 f8 01 00 00       	jmp    1027f9 <__alltraps>

00102601 <vector214>:
.globl vector214
vector214:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $214
  102603:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102608:	e9 ec 01 00 00       	jmp    1027f9 <__alltraps>

0010260d <vector215>:
.globl vector215
vector215:
  pushl $0
  10260d:	6a 00                	push   $0x0
  pushl $215
  10260f:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102614:	e9 e0 01 00 00       	jmp    1027f9 <__alltraps>

00102619 <vector216>:
.globl vector216
vector216:
  pushl $0
  102619:	6a 00                	push   $0x0
  pushl $216
  10261b:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102620:	e9 d4 01 00 00       	jmp    1027f9 <__alltraps>

00102625 <vector217>:
.globl vector217
vector217:
  pushl $0
  102625:	6a 00                	push   $0x0
  pushl $217
  102627:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10262c:	e9 c8 01 00 00       	jmp    1027f9 <__alltraps>

00102631 <vector218>:
.globl vector218
vector218:
  pushl $0
  102631:	6a 00                	push   $0x0
  pushl $218
  102633:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102638:	e9 bc 01 00 00       	jmp    1027f9 <__alltraps>

0010263d <vector219>:
.globl vector219
vector219:
  pushl $0
  10263d:	6a 00                	push   $0x0
  pushl $219
  10263f:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102644:	e9 b0 01 00 00       	jmp    1027f9 <__alltraps>

00102649 <vector220>:
.globl vector220
vector220:
  pushl $0
  102649:	6a 00                	push   $0x0
  pushl $220
  10264b:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102650:	e9 a4 01 00 00       	jmp    1027f9 <__alltraps>

00102655 <vector221>:
.globl vector221
vector221:
  pushl $0
  102655:	6a 00                	push   $0x0
  pushl $221
  102657:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10265c:	e9 98 01 00 00       	jmp    1027f9 <__alltraps>

00102661 <vector222>:
.globl vector222
vector222:
  pushl $0
  102661:	6a 00                	push   $0x0
  pushl $222
  102663:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102668:	e9 8c 01 00 00       	jmp    1027f9 <__alltraps>

0010266d <vector223>:
.globl vector223
vector223:
  pushl $0
  10266d:	6a 00                	push   $0x0
  pushl $223
  10266f:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102674:	e9 80 01 00 00       	jmp    1027f9 <__alltraps>

00102679 <vector224>:
.globl vector224
vector224:
  pushl $0
  102679:	6a 00                	push   $0x0
  pushl $224
  10267b:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102680:	e9 74 01 00 00       	jmp    1027f9 <__alltraps>

00102685 <vector225>:
.globl vector225
vector225:
  pushl $0
  102685:	6a 00                	push   $0x0
  pushl $225
  102687:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10268c:	e9 68 01 00 00       	jmp    1027f9 <__alltraps>

00102691 <vector226>:
.globl vector226
vector226:
  pushl $0
  102691:	6a 00                	push   $0x0
  pushl $226
  102693:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102698:	e9 5c 01 00 00       	jmp    1027f9 <__alltraps>

0010269d <vector227>:
.globl vector227
vector227:
  pushl $0
  10269d:	6a 00                	push   $0x0
  pushl $227
  10269f:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1026a4:	e9 50 01 00 00       	jmp    1027f9 <__alltraps>

001026a9 <vector228>:
.globl vector228
vector228:
  pushl $0
  1026a9:	6a 00                	push   $0x0
  pushl $228
  1026ab:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1026b0:	e9 44 01 00 00       	jmp    1027f9 <__alltraps>

001026b5 <vector229>:
.globl vector229
vector229:
  pushl $0
  1026b5:	6a 00                	push   $0x0
  pushl $229
  1026b7:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026bc:	e9 38 01 00 00       	jmp    1027f9 <__alltraps>

001026c1 <vector230>:
.globl vector230
vector230:
  pushl $0
  1026c1:	6a 00                	push   $0x0
  pushl $230
  1026c3:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1026c8:	e9 2c 01 00 00       	jmp    1027f9 <__alltraps>

001026cd <vector231>:
.globl vector231
vector231:
  pushl $0
  1026cd:	6a 00                	push   $0x0
  pushl $231
  1026cf:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1026d4:	e9 20 01 00 00       	jmp    1027f9 <__alltraps>

001026d9 <vector232>:
.globl vector232
vector232:
  pushl $0
  1026d9:	6a 00                	push   $0x0
  pushl $232
  1026db:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1026e0:	e9 14 01 00 00       	jmp    1027f9 <__alltraps>

001026e5 <vector233>:
.globl vector233
vector233:
  pushl $0
  1026e5:	6a 00                	push   $0x0
  pushl $233
  1026e7:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1026ec:	e9 08 01 00 00       	jmp    1027f9 <__alltraps>

001026f1 <vector234>:
.globl vector234
vector234:
  pushl $0
  1026f1:	6a 00                	push   $0x0
  pushl $234
  1026f3:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1026f8:	e9 fc 00 00 00       	jmp    1027f9 <__alltraps>

001026fd <vector235>:
.globl vector235
vector235:
  pushl $0
  1026fd:	6a 00                	push   $0x0
  pushl $235
  1026ff:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102704:	e9 f0 00 00 00       	jmp    1027f9 <__alltraps>

00102709 <vector236>:
.globl vector236
vector236:
  pushl $0
  102709:	6a 00                	push   $0x0
  pushl $236
  10270b:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102710:	e9 e4 00 00 00       	jmp    1027f9 <__alltraps>

00102715 <vector237>:
.globl vector237
vector237:
  pushl $0
  102715:	6a 00                	push   $0x0
  pushl $237
  102717:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10271c:	e9 d8 00 00 00       	jmp    1027f9 <__alltraps>

00102721 <vector238>:
.globl vector238
vector238:
  pushl $0
  102721:	6a 00                	push   $0x0
  pushl $238
  102723:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102728:	e9 cc 00 00 00       	jmp    1027f9 <__alltraps>

0010272d <vector239>:
.globl vector239
vector239:
  pushl $0
  10272d:	6a 00                	push   $0x0
  pushl $239
  10272f:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102734:	e9 c0 00 00 00       	jmp    1027f9 <__alltraps>

00102739 <vector240>:
.globl vector240
vector240:
  pushl $0
  102739:	6a 00                	push   $0x0
  pushl $240
  10273b:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102740:	e9 b4 00 00 00       	jmp    1027f9 <__alltraps>

00102745 <vector241>:
.globl vector241
vector241:
  pushl $0
  102745:	6a 00                	push   $0x0
  pushl $241
  102747:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10274c:	e9 a8 00 00 00       	jmp    1027f9 <__alltraps>

00102751 <vector242>:
.globl vector242
vector242:
  pushl $0
  102751:	6a 00                	push   $0x0
  pushl $242
  102753:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102758:	e9 9c 00 00 00       	jmp    1027f9 <__alltraps>

0010275d <vector243>:
.globl vector243
vector243:
  pushl $0
  10275d:	6a 00                	push   $0x0
  pushl $243
  10275f:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102764:	e9 90 00 00 00       	jmp    1027f9 <__alltraps>

00102769 <vector244>:
.globl vector244
vector244:
  pushl $0
  102769:	6a 00                	push   $0x0
  pushl $244
  10276b:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102770:	e9 84 00 00 00       	jmp    1027f9 <__alltraps>

00102775 <vector245>:
.globl vector245
vector245:
  pushl $0
  102775:	6a 00                	push   $0x0
  pushl $245
  102777:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10277c:	e9 78 00 00 00       	jmp    1027f9 <__alltraps>

00102781 <vector246>:
.globl vector246
vector246:
  pushl $0
  102781:	6a 00                	push   $0x0
  pushl $246
  102783:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102788:	e9 6c 00 00 00       	jmp    1027f9 <__alltraps>

0010278d <vector247>:
.globl vector247
vector247:
  pushl $0
  10278d:	6a 00                	push   $0x0
  pushl $247
  10278f:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102794:	e9 60 00 00 00       	jmp    1027f9 <__alltraps>

00102799 <vector248>:
.globl vector248
vector248:
  pushl $0
  102799:	6a 00                	push   $0x0
  pushl $248
  10279b:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1027a0:	e9 54 00 00 00       	jmp    1027f9 <__alltraps>

001027a5 <vector249>:
.globl vector249
vector249:
  pushl $0
  1027a5:	6a 00                	push   $0x0
  pushl $249
  1027a7:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1027ac:	e9 48 00 00 00       	jmp    1027f9 <__alltraps>

001027b1 <vector250>:
.globl vector250
vector250:
  pushl $0
  1027b1:	6a 00                	push   $0x0
  pushl $250
  1027b3:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027b8:	e9 3c 00 00 00       	jmp    1027f9 <__alltraps>

001027bd <vector251>:
.globl vector251
vector251:
  pushl $0
  1027bd:	6a 00                	push   $0x0
  pushl $251
  1027bf:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1027c4:	e9 30 00 00 00       	jmp    1027f9 <__alltraps>

001027c9 <vector252>:
.globl vector252
vector252:
  pushl $0
  1027c9:	6a 00                	push   $0x0
  pushl $252
  1027cb:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1027d0:	e9 24 00 00 00       	jmp    1027f9 <__alltraps>

001027d5 <vector253>:
.globl vector253
vector253:
  pushl $0
  1027d5:	6a 00                	push   $0x0
  pushl $253
  1027d7:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1027dc:	e9 18 00 00 00       	jmp    1027f9 <__alltraps>

001027e1 <vector254>:
.globl vector254
vector254:
  pushl $0
  1027e1:	6a 00                	push   $0x0
  pushl $254
  1027e3:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1027e8:	e9 0c 00 00 00       	jmp    1027f9 <__alltraps>

001027ed <vector255>:
.globl vector255
vector255:
  pushl $0
  1027ed:	6a 00                	push   $0x0
  pushl $255
  1027ef:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1027f4:	e9 00 00 00 00       	jmp    1027f9 <__alltraps>

001027f9 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1027f9:	1e                   	push   %ds
    pushl %es
  1027fa:	06                   	push   %es
    pushl %fs
  1027fb:	0f a0                	push   %fs
    pushl %gs
  1027fd:	0f a8                	push   %gs
    pushal
  1027ff:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102800:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102805:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102807:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102809:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10280a:	e8 61 f5 ff ff       	call   101d70 <trap>

    # pop the pushed stack pointer
    popl %esp
  10280f:	5c                   	pop    %esp

00102810 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102810:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102811:	0f a9                	pop    %gs
    popl %fs
  102813:	0f a1                	pop    %fs
    popl %es
  102815:	07                   	pop    %es
    popl %ds
  102816:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102817:	83 c4 08             	add    $0x8,%esp
    iret
  10281a:	cf                   	iret   

0010281b <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10281b:	55                   	push   %ebp
  10281c:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10281e:	8b 45 08             	mov    0x8(%ebp),%eax
  102821:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102824:	b8 23 00 00 00       	mov    $0x23,%eax
  102829:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10282b:	b8 23 00 00 00       	mov    $0x23,%eax
  102830:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102832:	b8 10 00 00 00       	mov    $0x10,%eax
  102837:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102839:	b8 10 00 00 00       	mov    $0x10,%eax
  10283e:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102840:	b8 10 00 00 00       	mov    $0x10,%eax
  102845:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102847:	ea 4e 28 10 00 08 00 	ljmp   $0x8,$0x10284e
}
  10284e:	90                   	nop
  10284f:	5d                   	pop    %ebp
  102850:	c3                   	ret    

00102851 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102851:	55                   	push   %ebp
  102852:	89 e5                	mov    %esp,%ebp
  102854:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102857:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  10285c:	05 00 04 00 00       	add    $0x400,%eax
  102861:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102866:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10286d:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10286f:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102876:	68 00 
  102878:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10287d:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102883:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102888:	c1 e8 10             	shr    $0x10,%eax
  10288b:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102890:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102897:	83 e0 f0             	and    $0xfffffff0,%eax
  10289a:	83 c8 09             	or     $0x9,%eax
  10289d:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028a2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028a9:	83 c8 10             	or     $0x10,%eax
  1028ac:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028b1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028b8:	83 e0 9f             	and    $0xffffff9f,%eax
  1028bb:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028c0:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028c7:	83 c8 80             	or     $0xffffff80,%eax
  1028ca:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028cf:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028d6:	83 e0 f0             	and    $0xfffffff0,%eax
  1028d9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028de:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028e5:	83 e0 ef             	and    $0xffffffef,%eax
  1028e8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028ed:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028f4:	83 e0 df             	and    $0xffffffdf,%eax
  1028f7:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028fc:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102903:	83 c8 40             	or     $0x40,%eax
  102906:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10290b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102912:	83 e0 7f             	and    $0x7f,%eax
  102915:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10291a:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10291f:	c1 e8 18             	shr    $0x18,%eax
  102922:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102927:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10292e:	83 e0 ef             	and    $0xffffffef,%eax
  102931:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102936:	68 10 ea 10 00       	push   $0x10ea10
  10293b:	e8 db fe ff ff       	call   10281b <lgdt>
  102940:	83 c4 04             	add    $0x4,%esp
  102943:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102949:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10294d:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102950:	90                   	nop
  102951:	c9                   	leave  
  102952:	c3                   	ret    

00102953 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102953:	55                   	push   %ebp
  102954:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102956:	e8 f6 fe ff ff       	call   102851 <gdt_init>
}
  10295b:	90                   	nop
  10295c:	5d                   	pop    %ebp
  10295d:	c3                   	ret    

0010295e <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10295e:	55                   	push   %ebp
  10295f:	89 e5                	mov    %esp,%ebp
  102961:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102964:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  10296b:	eb 04                	jmp    102971 <strlen+0x13>
        cnt ++;
  10296d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102971:	8b 45 08             	mov    0x8(%ebp),%eax
  102974:	8d 50 01             	lea    0x1(%eax),%edx
  102977:	89 55 08             	mov    %edx,0x8(%ebp)
  10297a:	0f b6 00             	movzbl (%eax),%eax
  10297d:	84 c0                	test   %al,%al
  10297f:	75 ec                	jne    10296d <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102981:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102984:	c9                   	leave  
  102985:	c3                   	ret    

00102986 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102986:	55                   	push   %ebp
  102987:	89 e5                	mov    %esp,%ebp
  102989:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10298c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102993:	eb 04                	jmp    102999 <strnlen+0x13>
        cnt ++;
  102995:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102999:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10299c:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10299f:	73 10                	jae    1029b1 <strnlen+0x2b>
  1029a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a4:	8d 50 01             	lea    0x1(%eax),%edx
  1029a7:	89 55 08             	mov    %edx,0x8(%ebp)
  1029aa:	0f b6 00             	movzbl (%eax),%eax
  1029ad:	84 c0                	test   %al,%al
  1029af:	75 e4                	jne    102995 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1029b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1029b4:	c9                   	leave  
  1029b5:	c3                   	ret    

001029b6 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1029b6:	55                   	push   %ebp
  1029b7:	89 e5                	mov    %esp,%ebp
  1029b9:	57                   	push   %edi
  1029ba:	56                   	push   %esi
  1029bb:	83 ec 20             	sub    $0x20,%esp
  1029be:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1029ca:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029d0:	89 d1                	mov    %edx,%ecx
  1029d2:	89 c2                	mov    %eax,%edx
  1029d4:	89 ce                	mov    %ecx,%esi
  1029d6:	89 d7                	mov    %edx,%edi
  1029d8:	ac                   	lods   %ds:(%esi),%al
  1029d9:	aa                   	stos   %al,%es:(%edi)
  1029da:	84 c0                	test   %al,%al
  1029dc:	75 fa                	jne    1029d8 <strcpy+0x22>
  1029de:	89 fa                	mov    %edi,%edx
  1029e0:	89 f1                	mov    %esi,%ecx
  1029e2:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1029e5:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1029e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1029eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  1029ee:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1029ef:	83 c4 20             	add    $0x20,%esp
  1029f2:	5e                   	pop    %esi
  1029f3:	5f                   	pop    %edi
  1029f4:	5d                   	pop    %ebp
  1029f5:	c3                   	ret    

001029f6 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1029f6:	55                   	push   %ebp
  1029f7:	89 e5                	mov    %esp,%ebp
  1029f9:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1029fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102a02:	eb 21                	jmp    102a25 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102a04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a07:	0f b6 10             	movzbl (%eax),%edx
  102a0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a0d:	88 10                	mov    %dl,(%eax)
  102a0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a12:	0f b6 00             	movzbl (%eax),%eax
  102a15:	84 c0                	test   %al,%al
  102a17:	74 04                	je     102a1d <strncpy+0x27>
            src ++;
  102a19:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102a1d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102a21:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102a25:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a29:	75 d9                	jne    102a04 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102a2b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a2e:	c9                   	leave  
  102a2f:	c3                   	ret    

00102a30 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102a30:	55                   	push   %ebp
  102a31:	89 e5                	mov    %esp,%ebp
  102a33:	57                   	push   %edi
  102a34:	56                   	push   %esi
  102a35:	83 ec 20             	sub    $0x20,%esp
  102a38:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102a44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102a47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a4a:	89 d1                	mov    %edx,%ecx
  102a4c:	89 c2                	mov    %eax,%edx
  102a4e:	89 ce                	mov    %ecx,%esi
  102a50:	89 d7                	mov    %edx,%edi
  102a52:	ac                   	lods   %ds:(%esi),%al
  102a53:	ae                   	scas   %es:(%edi),%al
  102a54:	75 08                	jne    102a5e <strcmp+0x2e>
  102a56:	84 c0                	test   %al,%al
  102a58:	75 f8                	jne    102a52 <strcmp+0x22>
  102a5a:	31 c0                	xor    %eax,%eax
  102a5c:	eb 04                	jmp    102a62 <strcmp+0x32>
  102a5e:	19 c0                	sbb    %eax,%eax
  102a60:	0c 01                	or     $0x1,%al
  102a62:	89 fa                	mov    %edi,%edx
  102a64:	89 f1                	mov    %esi,%ecx
  102a66:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102a69:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102a6c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102a6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102a72:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102a73:	83 c4 20             	add    $0x20,%esp
  102a76:	5e                   	pop    %esi
  102a77:	5f                   	pop    %edi
  102a78:	5d                   	pop    %ebp
  102a79:	c3                   	ret    

00102a7a <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102a7a:	55                   	push   %ebp
  102a7b:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102a7d:	eb 0c                	jmp    102a8b <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102a7f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102a83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a87:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102a8b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a8f:	74 1a                	je     102aab <strncmp+0x31>
  102a91:	8b 45 08             	mov    0x8(%ebp),%eax
  102a94:	0f b6 00             	movzbl (%eax),%eax
  102a97:	84 c0                	test   %al,%al
  102a99:	74 10                	je     102aab <strncmp+0x31>
  102a9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9e:	0f b6 10             	movzbl (%eax),%edx
  102aa1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aa4:	0f b6 00             	movzbl (%eax),%eax
  102aa7:	38 c2                	cmp    %al,%dl
  102aa9:	74 d4                	je     102a7f <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102aab:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102aaf:	74 18                	je     102ac9 <strncmp+0x4f>
  102ab1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab4:	0f b6 00             	movzbl (%eax),%eax
  102ab7:	0f b6 d0             	movzbl %al,%edx
  102aba:	8b 45 0c             	mov    0xc(%ebp),%eax
  102abd:	0f b6 00             	movzbl (%eax),%eax
  102ac0:	0f b6 c0             	movzbl %al,%eax
  102ac3:	29 c2                	sub    %eax,%edx
  102ac5:	89 d0                	mov    %edx,%eax
  102ac7:	eb 05                	jmp    102ace <strncmp+0x54>
  102ac9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ace:	5d                   	pop    %ebp
  102acf:	c3                   	ret    

00102ad0 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102ad0:	55                   	push   %ebp
  102ad1:	89 e5                	mov    %esp,%ebp
  102ad3:	83 ec 04             	sub    $0x4,%esp
  102ad6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad9:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102adc:	eb 14                	jmp    102af2 <strchr+0x22>
        if (*s == c) {
  102ade:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae1:	0f b6 00             	movzbl (%eax),%eax
  102ae4:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102ae7:	75 05                	jne    102aee <strchr+0x1e>
            return (char *)s;
  102ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  102aec:	eb 13                	jmp    102b01 <strchr+0x31>
        }
        s ++;
  102aee:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102af2:	8b 45 08             	mov    0x8(%ebp),%eax
  102af5:	0f b6 00             	movzbl (%eax),%eax
  102af8:	84 c0                	test   %al,%al
  102afa:	75 e2                	jne    102ade <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102afc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102b01:	c9                   	leave  
  102b02:	c3                   	ret    

00102b03 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102b03:	55                   	push   %ebp
  102b04:	89 e5                	mov    %esp,%ebp
  102b06:	83 ec 04             	sub    $0x4,%esp
  102b09:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b0c:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102b0f:	eb 0f                	jmp    102b20 <strfind+0x1d>
        if (*s == c) {
  102b11:	8b 45 08             	mov    0x8(%ebp),%eax
  102b14:	0f b6 00             	movzbl (%eax),%eax
  102b17:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102b1a:	74 10                	je     102b2c <strfind+0x29>
            break;
        }
        s ++;
  102b1c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102b20:	8b 45 08             	mov    0x8(%ebp),%eax
  102b23:	0f b6 00             	movzbl (%eax),%eax
  102b26:	84 c0                	test   %al,%al
  102b28:	75 e7                	jne    102b11 <strfind+0xe>
  102b2a:	eb 01                	jmp    102b2d <strfind+0x2a>
        if (*s == c) {
            break;
  102b2c:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102b2d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b30:	c9                   	leave  
  102b31:	c3                   	ret    

00102b32 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102b32:	55                   	push   %ebp
  102b33:	89 e5                	mov    %esp,%ebp
  102b35:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102b38:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102b3f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102b46:	eb 04                	jmp    102b4c <strtol+0x1a>
        s ++;
  102b48:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102b4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4f:	0f b6 00             	movzbl (%eax),%eax
  102b52:	3c 20                	cmp    $0x20,%al
  102b54:	74 f2                	je     102b48 <strtol+0x16>
  102b56:	8b 45 08             	mov    0x8(%ebp),%eax
  102b59:	0f b6 00             	movzbl (%eax),%eax
  102b5c:	3c 09                	cmp    $0x9,%al
  102b5e:	74 e8                	je     102b48 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102b60:	8b 45 08             	mov    0x8(%ebp),%eax
  102b63:	0f b6 00             	movzbl (%eax),%eax
  102b66:	3c 2b                	cmp    $0x2b,%al
  102b68:	75 06                	jne    102b70 <strtol+0x3e>
        s ++;
  102b6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b6e:	eb 15                	jmp    102b85 <strtol+0x53>
    }
    else if (*s == '-') {
  102b70:	8b 45 08             	mov    0x8(%ebp),%eax
  102b73:	0f b6 00             	movzbl (%eax),%eax
  102b76:	3c 2d                	cmp    $0x2d,%al
  102b78:	75 0b                	jne    102b85 <strtol+0x53>
        s ++, neg = 1;
  102b7a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b7e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102b85:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b89:	74 06                	je     102b91 <strtol+0x5f>
  102b8b:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102b8f:	75 24                	jne    102bb5 <strtol+0x83>
  102b91:	8b 45 08             	mov    0x8(%ebp),%eax
  102b94:	0f b6 00             	movzbl (%eax),%eax
  102b97:	3c 30                	cmp    $0x30,%al
  102b99:	75 1a                	jne    102bb5 <strtol+0x83>
  102b9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9e:	83 c0 01             	add    $0x1,%eax
  102ba1:	0f b6 00             	movzbl (%eax),%eax
  102ba4:	3c 78                	cmp    $0x78,%al
  102ba6:	75 0d                	jne    102bb5 <strtol+0x83>
        s += 2, base = 16;
  102ba8:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102bac:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102bb3:	eb 2a                	jmp    102bdf <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102bb5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bb9:	75 17                	jne    102bd2 <strtol+0xa0>
  102bbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbe:	0f b6 00             	movzbl (%eax),%eax
  102bc1:	3c 30                	cmp    $0x30,%al
  102bc3:	75 0d                	jne    102bd2 <strtol+0xa0>
        s ++, base = 8;
  102bc5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102bc9:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102bd0:	eb 0d                	jmp    102bdf <strtol+0xad>
    }
    else if (base == 0) {
  102bd2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bd6:	75 07                	jne    102bdf <strtol+0xad>
        base = 10;
  102bd8:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  102be2:	0f b6 00             	movzbl (%eax),%eax
  102be5:	3c 2f                	cmp    $0x2f,%al
  102be7:	7e 1b                	jle    102c04 <strtol+0xd2>
  102be9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bec:	0f b6 00             	movzbl (%eax),%eax
  102bef:	3c 39                	cmp    $0x39,%al
  102bf1:	7f 11                	jg     102c04 <strtol+0xd2>
            dig = *s - '0';
  102bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf6:	0f b6 00             	movzbl (%eax),%eax
  102bf9:	0f be c0             	movsbl %al,%eax
  102bfc:	83 e8 30             	sub    $0x30,%eax
  102bff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c02:	eb 48                	jmp    102c4c <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102c04:	8b 45 08             	mov    0x8(%ebp),%eax
  102c07:	0f b6 00             	movzbl (%eax),%eax
  102c0a:	3c 60                	cmp    $0x60,%al
  102c0c:	7e 1b                	jle    102c29 <strtol+0xf7>
  102c0e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c11:	0f b6 00             	movzbl (%eax),%eax
  102c14:	3c 7a                	cmp    $0x7a,%al
  102c16:	7f 11                	jg     102c29 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102c18:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1b:	0f b6 00             	movzbl (%eax),%eax
  102c1e:	0f be c0             	movsbl %al,%eax
  102c21:	83 e8 57             	sub    $0x57,%eax
  102c24:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c27:	eb 23                	jmp    102c4c <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102c29:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2c:	0f b6 00             	movzbl (%eax),%eax
  102c2f:	3c 40                	cmp    $0x40,%al
  102c31:	7e 3c                	jle    102c6f <strtol+0x13d>
  102c33:	8b 45 08             	mov    0x8(%ebp),%eax
  102c36:	0f b6 00             	movzbl (%eax),%eax
  102c39:	3c 5a                	cmp    $0x5a,%al
  102c3b:	7f 32                	jg     102c6f <strtol+0x13d>
            dig = *s - 'A' + 10;
  102c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c40:	0f b6 00             	movzbl (%eax),%eax
  102c43:	0f be c0             	movsbl %al,%eax
  102c46:	83 e8 37             	sub    $0x37,%eax
  102c49:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c4f:	3b 45 10             	cmp    0x10(%ebp),%eax
  102c52:	7d 1a                	jge    102c6e <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102c54:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c58:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c5b:	0f af 45 10          	imul   0x10(%ebp),%eax
  102c5f:	89 c2                	mov    %eax,%edx
  102c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c64:	01 d0                	add    %edx,%eax
  102c66:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102c69:	e9 71 ff ff ff       	jmp    102bdf <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102c6e:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102c6f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c73:	74 08                	je     102c7d <strtol+0x14b>
        *endptr = (char *) s;
  102c75:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c78:	8b 55 08             	mov    0x8(%ebp),%edx
  102c7b:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102c7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102c81:	74 07                	je     102c8a <strtol+0x158>
  102c83:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c86:	f7 d8                	neg    %eax
  102c88:	eb 03                	jmp    102c8d <strtol+0x15b>
  102c8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102c8d:	c9                   	leave  
  102c8e:	c3                   	ret    

00102c8f <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102c8f:	55                   	push   %ebp
  102c90:	89 e5                	mov    %esp,%ebp
  102c92:	57                   	push   %edi
  102c93:	83 ec 24             	sub    $0x24,%esp
  102c96:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c99:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102c9c:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102ca0:	8b 55 08             	mov    0x8(%ebp),%edx
  102ca3:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ca6:	88 45 f7             	mov    %al,-0x9(%ebp)
  102ca9:	8b 45 10             	mov    0x10(%ebp),%eax
  102cac:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102caf:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102cb2:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102cb6:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102cb9:	89 d7                	mov    %edx,%edi
  102cbb:	f3 aa                	rep stos %al,%es:(%edi)
  102cbd:	89 fa                	mov    %edi,%edx
  102cbf:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102cc2:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102cc5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102cc8:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102cc9:	83 c4 24             	add    $0x24,%esp
  102ccc:	5f                   	pop    %edi
  102ccd:	5d                   	pop    %ebp
  102cce:	c3                   	ret    

00102ccf <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102ccf:	55                   	push   %ebp
  102cd0:	89 e5                	mov    %esp,%ebp
  102cd2:	57                   	push   %edi
  102cd3:	56                   	push   %esi
  102cd4:	53                   	push   %ebx
  102cd5:	83 ec 30             	sub    $0x30,%esp
  102cd8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cde:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ce4:	8b 45 10             	mov    0x10(%ebp),%eax
  102ce7:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102cea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ced:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102cf0:	73 42                	jae    102d34 <memmove+0x65>
  102cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cf5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102cf8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cfb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cfe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d01:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102d04:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d07:	c1 e8 02             	shr    $0x2,%eax
  102d0a:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102d0c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102d0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d12:	89 d7                	mov    %edx,%edi
  102d14:	89 c6                	mov    %eax,%esi
  102d16:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102d18:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102d1b:	83 e1 03             	and    $0x3,%ecx
  102d1e:	74 02                	je     102d22 <memmove+0x53>
  102d20:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d22:	89 f0                	mov    %esi,%eax
  102d24:	89 fa                	mov    %edi,%edx
  102d26:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102d29:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102d2c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102d2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102d32:	eb 36                	jmp    102d6a <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102d34:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d37:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d3d:	01 c2                	add    %eax,%edx
  102d3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d42:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102d45:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d48:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102d4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d4e:	89 c1                	mov    %eax,%ecx
  102d50:	89 d8                	mov    %ebx,%eax
  102d52:	89 d6                	mov    %edx,%esi
  102d54:	89 c7                	mov    %eax,%edi
  102d56:	fd                   	std    
  102d57:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d59:	fc                   	cld    
  102d5a:	89 f8                	mov    %edi,%eax
  102d5c:	89 f2                	mov    %esi,%edx
  102d5e:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102d61:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102d64:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102d67:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102d6a:	83 c4 30             	add    $0x30,%esp
  102d6d:	5b                   	pop    %ebx
  102d6e:	5e                   	pop    %esi
  102d6f:	5f                   	pop    %edi
  102d70:	5d                   	pop    %ebp
  102d71:	c3                   	ret    

00102d72 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102d72:	55                   	push   %ebp
  102d73:	89 e5                	mov    %esp,%ebp
  102d75:	57                   	push   %edi
  102d76:	56                   	push   %esi
  102d77:	83 ec 20             	sub    $0x20,%esp
  102d7a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d80:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d83:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d86:	8b 45 10             	mov    0x10(%ebp),%eax
  102d89:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102d8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d8f:	c1 e8 02             	shr    $0x2,%eax
  102d92:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102d94:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d97:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d9a:	89 d7                	mov    %edx,%edi
  102d9c:	89 c6                	mov    %eax,%esi
  102d9e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102da0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102da3:	83 e1 03             	and    $0x3,%ecx
  102da6:	74 02                	je     102daa <memcpy+0x38>
  102da8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102daa:	89 f0                	mov    %esi,%eax
  102dac:	89 fa                	mov    %edi,%edx
  102dae:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102db1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102db4:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102db7:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102dba:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102dbb:	83 c4 20             	add    $0x20,%esp
  102dbe:	5e                   	pop    %esi
  102dbf:	5f                   	pop    %edi
  102dc0:	5d                   	pop    %ebp
  102dc1:	c3                   	ret    

00102dc2 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102dc2:	55                   	push   %ebp
  102dc3:	89 e5                	mov    %esp,%ebp
  102dc5:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102dc8:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102dce:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd1:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102dd4:	eb 30                	jmp    102e06 <memcmp+0x44>
        if (*s1 != *s2) {
  102dd6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102dd9:	0f b6 10             	movzbl (%eax),%edx
  102ddc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ddf:	0f b6 00             	movzbl (%eax),%eax
  102de2:	38 c2                	cmp    %al,%dl
  102de4:	74 18                	je     102dfe <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102de6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102de9:	0f b6 00             	movzbl (%eax),%eax
  102dec:	0f b6 d0             	movzbl %al,%edx
  102def:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102df2:	0f b6 00             	movzbl (%eax),%eax
  102df5:	0f b6 c0             	movzbl %al,%eax
  102df8:	29 c2                	sub    %eax,%edx
  102dfa:	89 d0                	mov    %edx,%eax
  102dfc:	eb 1a                	jmp    102e18 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102dfe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102e02:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102e06:	8b 45 10             	mov    0x10(%ebp),%eax
  102e09:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e0c:	89 55 10             	mov    %edx,0x10(%ebp)
  102e0f:	85 c0                	test   %eax,%eax
  102e11:	75 c3                	jne    102dd6 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102e13:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102e18:	c9                   	leave  
  102e19:	c3                   	ret    

00102e1a <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102e1a:	55                   	push   %ebp
  102e1b:	89 e5                	mov    %esp,%ebp
  102e1d:	83 ec 38             	sub    $0x38,%esp
  102e20:	8b 45 10             	mov    0x10(%ebp),%eax
  102e23:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102e26:	8b 45 14             	mov    0x14(%ebp),%eax
  102e29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102e2c:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102e2f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102e32:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e35:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102e38:	8b 45 18             	mov    0x18(%ebp),%eax
  102e3b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e41:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102e44:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e47:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102e4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102e54:	74 1c                	je     102e72 <printnum+0x58>
  102e56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e59:	ba 00 00 00 00       	mov    $0x0,%edx
  102e5e:	f7 75 e4             	divl   -0x1c(%ebp)
  102e61:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102e64:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e67:	ba 00 00 00 00       	mov    $0x0,%edx
  102e6c:	f7 75 e4             	divl   -0x1c(%ebp)
  102e6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e72:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e75:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e78:	f7 75 e4             	divl   -0x1c(%ebp)
  102e7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e7e:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102e81:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e84:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e87:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e8a:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102e8d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e90:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102e93:	8b 45 18             	mov    0x18(%ebp),%eax
  102e96:	ba 00 00 00 00       	mov    $0x0,%edx
  102e9b:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102e9e:	77 41                	ja     102ee1 <printnum+0xc7>
  102ea0:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102ea3:	72 05                	jb     102eaa <printnum+0x90>
  102ea5:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102ea8:	77 37                	ja     102ee1 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102eaa:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102ead:	83 e8 01             	sub    $0x1,%eax
  102eb0:	83 ec 04             	sub    $0x4,%esp
  102eb3:	ff 75 20             	pushl  0x20(%ebp)
  102eb6:	50                   	push   %eax
  102eb7:	ff 75 18             	pushl  0x18(%ebp)
  102eba:	ff 75 ec             	pushl  -0x14(%ebp)
  102ebd:	ff 75 e8             	pushl  -0x18(%ebp)
  102ec0:	ff 75 0c             	pushl  0xc(%ebp)
  102ec3:	ff 75 08             	pushl  0x8(%ebp)
  102ec6:	e8 4f ff ff ff       	call   102e1a <printnum>
  102ecb:	83 c4 20             	add    $0x20,%esp
  102ece:	eb 1b                	jmp    102eeb <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102ed0:	83 ec 08             	sub    $0x8,%esp
  102ed3:	ff 75 0c             	pushl  0xc(%ebp)
  102ed6:	ff 75 20             	pushl  0x20(%ebp)
  102ed9:	8b 45 08             	mov    0x8(%ebp),%eax
  102edc:	ff d0                	call   *%eax
  102ede:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102ee1:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102ee5:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102ee9:	7f e5                	jg     102ed0 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102eeb:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102eee:	05 10 3c 10 00       	add    $0x103c10,%eax
  102ef3:	0f b6 00             	movzbl (%eax),%eax
  102ef6:	0f be c0             	movsbl %al,%eax
  102ef9:	83 ec 08             	sub    $0x8,%esp
  102efc:	ff 75 0c             	pushl  0xc(%ebp)
  102eff:	50                   	push   %eax
  102f00:	8b 45 08             	mov    0x8(%ebp),%eax
  102f03:	ff d0                	call   *%eax
  102f05:	83 c4 10             	add    $0x10,%esp
}
  102f08:	90                   	nop
  102f09:	c9                   	leave  
  102f0a:	c3                   	ret    

00102f0b <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102f0b:	55                   	push   %ebp
  102f0c:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102f0e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102f12:	7e 14                	jle    102f28 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102f14:	8b 45 08             	mov    0x8(%ebp),%eax
  102f17:	8b 00                	mov    (%eax),%eax
  102f19:	8d 48 08             	lea    0x8(%eax),%ecx
  102f1c:	8b 55 08             	mov    0x8(%ebp),%edx
  102f1f:	89 0a                	mov    %ecx,(%edx)
  102f21:	8b 50 04             	mov    0x4(%eax),%edx
  102f24:	8b 00                	mov    (%eax),%eax
  102f26:	eb 30                	jmp    102f58 <getuint+0x4d>
    }
    else if (lflag) {
  102f28:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f2c:	74 16                	je     102f44 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102f2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f31:	8b 00                	mov    (%eax),%eax
  102f33:	8d 48 04             	lea    0x4(%eax),%ecx
  102f36:	8b 55 08             	mov    0x8(%ebp),%edx
  102f39:	89 0a                	mov    %ecx,(%edx)
  102f3b:	8b 00                	mov    (%eax),%eax
  102f3d:	ba 00 00 00 00       	mov    $0x0,%edx
  102f42:	eb 14                	jmp    102f58 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102f44:	8b 45 08             	mov    0x8(%ebp),%eax
  102f47:	8b 00                	mov    (%eax),%eax
  102f49:	8d 48 04             	lea    0x4(%eax),%ecx
  102f4c:	8b 55 08             	mov    0x8(%ebp),%edx
  102f4f:	89 0a                	mov    %ecx,(%edx)
  102f51:	8b 00                	mov    (%eax),%eax
  102f53:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102f58:	5d                   	pop    %ebp
  102f59:	c3                   	ret    

00102f5a <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102f5a:	55                   	push   %ebp
  102f5b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102f5d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102f61:	7e 14                	jle    102f77 <getint+0x1d>
        return va_arg(*ap, long long);
  102f63:	8b 45 08             	mov    0x8(%ebp),%eax
  102f66:	8b 00                	mov    (%eax),%eax
  102f68:	8d 48 08             	lea    0x8(%eax),%ecx
  102f6b:	8b 55 08             	mov    0x8(%ebp),%edx
  102f6e:	89 0a                	mov    %ecx,(%edx)
  102f70:	8b 50 04             	mov    0x4(%eax),%edx
  102f73:	8b 00                	mov    (%eax),%eax
  102f75:	eb 28                	jmp    102f9f <getint+0x45>
    }
    else if (lflag) {
  102f77:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f7b:	74 12                	je     102f8f <getint+0x35>
        return va_arg(*ap, long);
  102f7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f80:	8b 00                	mov    (%eax),%eax
  102f82:	8d 48 04             	lea    0x4(%eax),%ecx
  102f85:	8b 55 08             	mov    0x8(%ebp),%edx
  102f88:	89 0a                	mov    %ecx,(%edx)
  102f8a:	8b 00                	mov    (%eax),%eax
  102f8c:	99                   	cltd   
  102f8d:	eb 10                	jmp    102f9f <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102f8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f92:	8b 00                	mov    (%eax),%eax
  102f94:	8d 48 04             	lea    0x4(%eax),%ecx
  102f97:	8b 55 08             	mov    0x8(%ebp),%edx
  102f9a:	89 0a                	mov    %ecx,(%edx)
  102f9c:	8b 00                	mov    (%eax),%eax
  102f9e:	99                   	cltd   
    }
}
  102f9f:	5d                   	pop    %ebp
  102fa0:	c3                   	ret    

00102fa1 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102fa1:	55                   	push   %ebp
  102fa2:	89 e5                	mov    %esp,%ebp
  102fa4:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102fa7:	8d 45 14             	lea    0x14(%ebp),%eax
  102faa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fb0:	50                   	push   %eax
  102fb1:	ff 75 10             	pushl  0x10(%ebp)
  102fb4:	ff 75 0c             	pushl  0xc(%ebp)
  102fb7:	ff 75 08             	pushl  0x8(%ebp)
  102fba:	e8 06 00 00 00       	call   102fc5 <vprintfmt>
  102fbf:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102fc2:	90                   	nop
  102fc3:	c9                   	leave  
  102fc4:	c3                   	ret    

00102fc5 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102fc5:	55                   	push   %ebp
  102fc6:	89 e5                	mov    %esp,%ebp
  102fc8:	56                   	push   %esi
  102fc9:	53                   	push   %ebx
  102fca:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102fcd:	eb 17                	jmp    102fe6 <vprintfmt+0x21>
            if (ch == '\0') {
  102fcf:	85 db                	test   %ebx,%ebx
  102fd1:	0f 84 8e 03 00 00    	je     103365 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102fd7:	83 ec 08             	sub    $0x8,%esp
  102fda:	ff 75 0c             	pushl  0xc(%ebp)
  102fdd:	53                   	push   %ebx
  102fde:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe1:	ff d0                	call   *%eax
  102fe3:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102fe6:	8b 45 10             	mov    0x10(%ebp),%eax
  102fe9:	8d 50 01             	lea    0x1(%eax),%edx
  102fec:	89 55 10             	mov    %edx,0x10(%ebp)
  102fef:	0f b6 00             	movzbl (%eax),%eax
  102ff2:	0f b6 d8             	movzbl %al,%ebx
  102ff5:	83 fb 25             	cmp    $0x25,%ebx
  102ff8:	75 d5                	jne    102fcf <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ffa:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ffe:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103005:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103008:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10300b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103012:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103015:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103018:	8b 45 10             	mov    0x10(%ebp),%eax
  10301b:	8d 50 01             	lea    0x1(%eax),%edx
  10301e:	89 55 10             	mov    %edx,0x10(%ebp)
  103021:	0f b6 00             	movzbl (%eax),%eax
  103024:	0f b6 d8             	movzbl %al,%ebx
  103027:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10302a:	83 f8 55             	cmp    $0x55,%eax
  10302d:	0f 87 05 03 00 00    	ja     103338 <vprintfmt+0x373>
  103033:	8b 04 85 34 3c 10 00 	mov    0x103c34(,%eax,4),%eax
  10303a:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10303c:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103040:	eb d6                	jmp    103018 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103042:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103046:	eb d0                	jmp    103018 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103048:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10304f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103052:	89 d0                	mov    %edx,%eax
  103054:	c1 e0 02             	shl    $0x2,%eax
  103057:	01 d0                	add    %edx,%eax
  103059:	01 c0                	add    %eax,%eax
  10305b:	01 d8                	add    %ebx,%eax
  10305d:	83 e8 30             	sub    $0x30,%eax
  103060:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103063:	8b 45 10             	mov    0x10(%ebp),%eax
  103066:	0f b6 00             	movzbl (%eax),%eax
  103069:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10306c:	83 fb 2f             	cmp    $0x2f,%ebx
  10306f:	7e 39                	jle    1030aa <vprintfmt+0xe5>
  103071:	83 fb 39             	cmp    $0x39,%ebx
  103074:	7f 34                	jg     1030aa <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103076:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  10307a:	eb d3                	jmp    10304f <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10307c:	8b 45 14             	mov    0x14(%ebp),%eax
  10307f:	8d 50 04             	lea    0x4(%eax),%edx
  103082:	89 55 14             	mov    %edx,0x14(%ebp)
  103085:	8b 00                	mov    (%eax),%eax
  103087:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10308a:	eb 1f                	jmp    1030ab <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  10308c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103090:	79 86                	jns    103018 <vprintfmt+0x53>
                width = 0;
  103092:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103099:	e9 7a ff ff ff       	jmp    103018 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  10309e:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1030a5:	e9 6e ff ff ff       	jmp    103018 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  1030aa:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  1030ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030af:	0f 89 63 ff ff ff    	jns    103018 <vprintfmt+0x53>
                width = precision, precision = -1;
  1030b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030bb:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1030c2:	e9 51 ff ff ff       	jmp    103018 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1030c7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1030cb:	e9 48 ff ff ff       	jmp    103018 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1030d0:	8b 45 14             	mov    0x14(%ebp),%eax
  1030d3:	8d 50 04             	lea    0x4(%eax),%edx
  1030d6:	89 55 14             	mov    %edx,0x14(%ebp)
  1030d9:	8b 00                	mov    (%eax),%eax
  1030db:	83 ec 08             	sub    $0x8,%esp
  1030de:	ff 75 0c             	pushl  0xc(%ebp)
  1030e1:	50                   	push   %eax
  1030e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e5:	ff d0                	call   *%eax
  1030e7:	83 c4 10             	add    $0x10,%esp
            break;
  1030ea:	e9 71 02 00 00       	jmp    103360 <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1030ef:	8b 45 14             	mov    0x14(%ebp),%eax
  1030f2:	8d 50 04             	lea    0x4(%eax),%edx
  1030f5:	89 55 14             	mov    %edx,0x14(%ebp)
  1030f8:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1030fa:	85 db                	test   %ebx,%ebx
  1030fc:	79 02                	jns    103100 <vprintfmt+0x13b>
                err = -err;
  1030fe:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103100:	83 fb 06             	cmp    $0x6,%ebx
  103103:	7f 0b                	jg     103110 <vprintfmt+0x14b>
  103105:	8b 34 9d f4 3b 10 00 	mov    0x103bf4(,%ebx,4),%esi
  10310c:	85 f6                	test   %esi,%esi
  10310e:	75 19                	jne    103129 <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  103110:	53                   	push   %ebx
  103111:	68 21 3c 10 00       	push   $0x103c21
  103116:	ff 75 0c             	pushl  0xc(%ebp)
  103119:	ff 75 08             	pushl  0x8(%ebp)
  10311c:	e8 80 fe ff ff       	call   102fa1 <printfmt>
  103121:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103124:	e9 37 02 00 00       	jmp    103360 <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  103129:	56                   	push   %esi
  10312a:	68 2a 3c 10 00       	push   $0x103c2a
  10312f:	ff 75 0c             	pushl  0xc(%ebp)
  103132:	ff 75 08             	pushl  0x8(%ebp)
  103135:	e8 67 fe ff ff       	call   102fa1 <printfmt>
  10313a:	83 c4 10             	add    $0x10,%esp
            }
            break;
  10313d:	e9 1e 02 00 00       	jmp    103360 <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103142:	8b 45 14             	mov    0x14(%ebp),%eax
  103145:	8d 50 04             	lea    0x4(%eax),%edx
  103148:	89 55 14             	mov    %edx,0x14(%ebp)
  10314b:	8b 30                	mov    (%eax),%esi
  10314d:	85 f6                	test   %esi,%esi
  10314f:	75 05                	jne    103156 <vprintfmt+0x191>
                p = "(null)";
  103151:	be 2d 3c 10 00       	mov    $0x103c2d,%esi
            }
            if (width > 0 && padc != '-') {
  103156:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10315a:	7e 76                	jle    1031d2 <vprintfmt+0x20d>
  10315c:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103160:	74 70                	je     1031d2 <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103162:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103165:	83 ec 08             	sub    $0x8,%esp
  103168:	50                   	push   %eax
  103169:	56                   	push   %esi
  10316a:	e8 17 f8 ff ff       	call   102986 <strnlen>
  10316f:	83 c4 10             	add    $0x10,%esp
  103172:	89 c2                	mov    %eax,%edx
  103174:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103177:	29 d0                	sub    %edx,%eax
  103179:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10317c:	eb 17                	jmp    103195 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  10317e:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103182:	83 ec 08             	sub    $0x8,%esp
  103185:	ff 75 0c             	pushl  0xc(%ebp)
  103188:	50                   	push   %eax
  103189:	8b 45 08             	mov    0x8(%ebp),%eax
  10318c:	ff d0                	call   *%eax
  10318e:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  103191:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103195:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103199:	7f e3                	jg     10317e <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10319b:	eb 35                	jmp    1031d2 <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  10319d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1031a1:	74 1c                	je     1031bf <vprintfmt+0x1fa>
  1031a3:	83 fb 1f             	cmp    $0x1f,%ebx
  1031a6:	7e 05                	jle    1031ad <vprintfmt+0x1e8>
  1031a8:	83 fb 7e             	cmp    $0x7e,%ebx
  1031ab:	7e 12                	jle    1031bf <vprintfmt+0x1fa>
                    putch('?', putdat);
  1031ad:	83 ec 08             	sub    $0x8,%esp
  1031b0:	ff 75 0c             	pushl  0xc(%ebp)
  1031b3:	6a 3f                	push   $0x3f
  1031b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b8:	ff d0                	call   *%eax
  1031ba:	83 c4 10             	add    $0x10,%esp
  1031bd:	eb 0f                	jmp    1031ce <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  1031bf:	83 ec 08             	sub    $0x8,%esp
  1031c2:	ff 75 0c             	pushl  0xc(%ebp)
  1031c5:	53                   	push   %ebx
  1031c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c9:	ff d0                	call   *%eax
  1031cb:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1031ce:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1031d2:	89 f0                	mov    %esi,%eax
  1031d4:	8d 70 01             	lea    0x1(%eax),%esi
  1031d7:	0f b6 00             	movzbl (%eax),%eax
  1031da:	0f be d8             	movsbl %al,%ebx
  1031dd:	85 db                	test   %ebx,%ebx
  1031df:	74 26                	je     103207 <vprintfmt+0x242>
  1031e1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031e5:	78 b6                	js     10319d <vprintfmt+0x1d8>
  1031e7:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  1031eb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031ef:	79 ac                	jns    10319d <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1031f1:	eb 14                	jmp    103207 <vprintfmt+0x242>
                putch(' ', putdat);
  1031f3:	83 ec 08             	sub    $0x8,%esp
  1031f6:	ff 75 0c             	pushl  0xc(%ebp)
  1031f9:	6a 20                	push   $0x20
  1031fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fe:	ff d0                	call   *%eax
  103200:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103203:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103207:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10320b:	7f e6                	jg     1031f3 <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  10320d:	e9 4e 01 00 00       	jmp    103360 <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103212:	83 ec 08             	sub    $0x8,%esp
  103215:	ff 75 e0             	pushl  -0x20(%ebp)
  103218:	8d 45 14             	lea    0x14(%ebp),%eax
  10321b:	50                   	push   %eax
  10321c:	e8 39 fd ff ff       	call   102f5a <getint>
  103221:	83 c4 10             	add    $0x10,%esp
  103224:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103227:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10322a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10322d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103230:	85 d2                	test   %edx,%edx
  103232:	79 23                	jns    103257 <vprintfmt+0x292>
                putch('-', putdat);
  103234:	83 ec 08             	sub    $0x8,%esp
  103237:	ff 75 0c             	pushl  0xc(%ebp)
  10323a:	6a 2d                	push   $0x2d
  10323c:	8b 45 08             	mov    0x8(%ebp),%eax
  10323f:	ff d0                	call   *%eax
  103241:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103244:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103247:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10324a:	f7 d8                	neg    %eax
  10324c:	83 d2 00             	adc    $0x0,%edx
  10324f:	f7 da                	neg    %edx
  103251:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103254:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103257:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10325e:	e9 9f 00 00 00       	jmp    103302 <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103263:	83 ec 08             	sub    $0x8,%esp
  103266:	ff 75 e0             	pushl  -0x20(%ebp)
  103269:	8d 45 14             	lea    0x14(%ebp),%eax
  10326c:	50                   	push   %eax
  10326d:	e8 99 fc ff ff       	call   102f0b <getuint>
  103272:	83 c4 10             	add    $0x10,%esp
  103275:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103278:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10327b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103282:	eb 7e                	jmp    103302 <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103284:	83 ec 08             	sub    $0x8,%esp
  103287:	ff 75 e0             	pushl  -0x20(%ebp)
  10328a:	8d 45 14             	lea    0x14(%ebp),%eax
  10328d:	50                   	push   %eax
  10328e:	e8 78 fc ff ff       	call   102f0b <getuint>
  103293:	83 c4 10             	add    $0x10,%esp
  103296:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103299:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  10329c:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1032a3:	eb 5d                	jmp    103302 <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  1032a5:	83 ec 08             	sub    $0x8,%esp
  1032a8:	ff 75 0c             	pushl  0xc(%ebp)
  1032ab:	6a 30                	push   $0x30
  1032ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b0:	ff d0                	call   *%eax
  1032b2:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1032b5:	83 ec 08             	sub    $0x8,%esp
  1032b8:	ff 75 0c             	pushl  0xc(%ebp)
  1032bb:	6a 78                	push   $0x78
  1032bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c0:	ff d0                	call   *%eax
  1032c2:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1032c5:	8b 45 14             	mov    0x14(%ebp),%eax
  1032c8:	8d 50 04             	lea    0x4(%eax),%edx
  1032cb:	89 55 14             	mov    %edx,0x14(%ebp)
  1032ce:	8b 00                	mov    (%eax),%eax
  1032d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1032da:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1032e1:	eb 1f                	jmp    103302 <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1032e3:	83 ec 08             	sub    $0x8,%esp
  1032e6:	ff 75 e0             	pushl  -0x20(%ebp)
  1032e9:	8d 45 14             	lea    0x14(%ebp),%eax
  1032ec:	50                   	push   %eax
  1032ed:	e8 19 fc ff ff       	call   102f0b <getuint>
  1032f2:	83 c4 10             	add    $0x10,%esp
  1032f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032f8:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1032fb:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103302:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103306:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103309:	83 ec 04             	sub    $0x4,%esp
  10330c:	52                   	push   %edx
  10330d:	ff 75 e8             	pushl  -0x18(%ebp)
  103310:	50                   	push   %eax
  103311:	ff 75 f4             	pushl  -0xc(%ebp)
  103314:	ff 75 f0             	pushl  -0x10(%ebp)
  103317:	ff 75 0c             	pushl  0xc(%ebp)
  10331a:	ff 75 08             	pushl  0x8(%ebp)
  10331d:	e8 f8 fa ff ff       	call   102e1a <printnum>
  103322:	83 c4 20             	add    $0x20,%esp
            break;
  103325:	eb 39                	jmp    103360 <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103327:	83 ec 08             	sub    $0x8,%esp
  10332a:	ff 75 0c             	pushl  0xc(%ebp)
  10332d:	53                   	push   %ebx
  10332e:	8b 45 08             	mov    0x8(%ebp),%eax
  103331:	ff d0                	call   *%eax
  103333:	83 c4 10             	add    $0x10,%esp
            break;
  103336:	eb 28                	jmp    103360 <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103338:	83 ec 08             	sub    $0x8,%esp
  10333b:	ff 75 0c             	pushl  0xc(%ebp)
  10333e:	6a 25                	push   $0x25
  103340:	8b 45 08             	mov    0x8(%ebp),%eax
  103343:	ff d0                	call   *%eax
  103345:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103348:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10334c:	eb 04                	jmp    103352 <vprintfmt+0x38d>
  10334e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103352:	8b 45 10             	mov    0x10(%ebp),%eax
  103355:	83 e8 01             	sub    $0x1,%eax
  103358:	0f b6 00             	movzbl (%eax),%eax
  10335b:	3c 25                	cmp    $0x25,%al
  10335d:	75 ef                	jne    10334e <vprintfmt+0x389>
                /* do nothing */;
            break;
  10335f:	90                   	nop
        }
    }
  103360:	e9 68 fc ff ff       	jmp    102fcd <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  103365:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103366:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103369:	5b                   	pop    %ebx
  10336a:	5e                   	pop    %esi
  10336b:	5d                   	pop    %ebp
  10336c:	c3                   	ret    

0010336d <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10336d:	55                   	push   %ebp
  10336e:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103370:	8b 45 0c             	mov    0xc(%ebp),%eax
  103373:	8b 40 08             	mov    0x8(%eax),%eax
  103376:	8d 50 01             	lea    0x1(%eax),%edx
  103379:	8b 45 0c             	mov    0xc(%ebp),%eax
  10337c:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10337f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103382:	8b 10                	mov    (%eax),%edx
  103384:	8b 45 0c             	mov    0xc(%ebp),%eax
  103387:	8b 40 04             	mov    0x4(%eax),%eax
  10338a:	39 c2                	cmp    %eax,%edx
  10338c:	73 12                	jae    1033a0 <sprintputch+0x33>
        *b->buf ++ = ch;
  10338e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103391:	8b 00                	mov    (%eax),%eax
  103393:	8d 48 01             	lea    0x1(%eax),%ecx
  103396:	8b 55 0c             	mov    0xc(%ebp),%edx
  103399:	89 0a                	mov    %ecx,(%edx)
  10339b:	8b 55 08             	mov    0x8(%ebp),%edx
  10339e:	88 10                	mov    %dl,(%eax)
    }
}
  1033a0:	90                   	nop
  1033a1:	5d                   	pop    %ebp
  1033a2:	c3                   	ret    

001033a3 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1033a3:	55                   	push   %ebp
  1033a4:	89 e5                	mov    %esp,%ebp
  1033a6:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1033a9:	8d 45 14             	lea    0x14(%ebp),%eax
  1033ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1033af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b2:	50                   	push   %eax
  1033b3:	ff 75 10             	pushl  0x10(%ebp)
  1033b6:	ff 75 0c             	pushl  0xc(%ebp)
  1033b9:	ff 75 08             	pushl  0x8(%ebp)
  1033bc:	e8 0b 00 00 00       	call   1033cc <vsnprintf>
  1033c1:	83 c4 10             	add    $0x10,%esp
  1033c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1033c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1033ca:	c9                   	leave  
  1033cb:	c3                   	ret    

001033cc <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1033cc:	55                   	push   %ebp
  1033cd:	89 e5                	mov    %esp,%ebp
  1033cf:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1033d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033db:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033de:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e1:	01 d0                	add    %edx,%eax
  1033e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1033ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1033f1:	74 0a                	je     1033fd <vsnprintf+0x31>
  1033f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033f9:	39 c2                	cmp    %eax,%edx
  1033fb:	76 07                	jbe    103404 <vsnprintf+0x38>
        return -E_INVAL;
  1033fd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103402:	eb 20                	jmp    103424 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103404:	ff 75 14             	pushl  0x14(%ebp)
  103407:	ff 75 10             	pushl  0x10(%ebp)
  10340a:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10340d:	50                   	push   %eax
  10340e:	68 6d 33 10 00       	push   $0x10336d
  103413:	e8 ad fb ff ff       	call   102fc5 <vprintfmt>
  103418:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10341b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10341e:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103421:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103424:	c9                   	leave  
  103425:	c3                   	ret    
