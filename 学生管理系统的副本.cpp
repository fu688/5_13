#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<conio.h>
#include<windows.h>
#include<conio.h>
#include<ctype.h>
#define LEN1   20
#define LEN2   10
typedef struct user {
	char username[LEN2];//用户名
	char password[LEN2];//密码
	struct user* next;//链表该节点指向下一个节点的指针
} Linklist1;
//定义存学生信息的链表的结构体 
typedef struct student {
	char name[LEN1];//学生姓名
	char number[LEN1];//学生学号
	char Class[LEN1];//学生班级
	int Chinese;//语文成绩
	int Math;//数学成绩
	int English;//英语成绩
	struct student* next;//链表该节点指向下一个节点的指针
} Linklist;
void menu();
int studentmenu(char username1[]);
int teachermenu(char username1[]);
int managemenu(char username1[]);
Linklist1* readaccount() {//读账号
    Linklist1* head, *end, *stu;
	FILE* fp;
	if ((fp = fopen("账户管理.txt", "rt")) == NULL) {
		printf("读文件出错，按任意键退出！");
		getch(); 
		exit(1);
	}
	head = (Linklist1*) malloc (sizeof(Linklist1));
	head->next = NULL;
	end = head;
	while (!feof(fp)) {
		stu = (Linklist1*) malloc (sizeof(Linklist1));	
		fscanf(fp, "%s %s\n", stu->username, stu->password);
		end->next = stu;
		end = stu;
	}
	end->next = NULL;
	fclose(fp);
	printf("\n文件中信息已正确读出，按任意键返回！\n");
	getch();
	return head;
	
    
}
void saveaccount(Linklist1* head) {//存账号
    FILE* fp;
	if ((fp = fopen("账户管理.txt", "at")) == NULL) {
		printf("写入文件出错，请按任意键退出！");
		getch();
		exit(1); 
	}
    fprintf(fp,"%s %s\n", head->username, head->password);
    printf("\n文件已成功保存，请按任意键返回！\n");
	getch();
	fclose(fp); 
}
void save1account(Linklist1* head) {
	Linklist1* stu;
	FILE* fp;
	if ((fp = fopen("账户管理.txt", "wt")) == NULL) {
		printf("写入文件出错，请按任意键退出！");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s\n", stu->username, stu->password);
	}
	printf("\n文件已成功保存，请按任意键返回！\n");
	getch(); 
	fclose(fp);
}

void zaisaveaccount(Linklist1* head) {
	Linklist1* stu;
	FILE* fp;
	if ((fp = fopen("账户管理.txt", "at")) == NULL) {
		printf("写入文件出错，请按任意键退出！");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s\n", stu->username, stu->password);
	}
	printf("\n文件已成功保存，请按任意键返回！\n");
	getch(); 
	fclose(fp);
} 
Linklist1* create1() {//建链表保存账号 
	Linklist1* head, *end, *stu;
	int i = 0, n;
	char choice;
	head = (Linklist1*) malloc (sizeof(Linklist1));
	head->next = NULL;
	end = head;
	do {
		stu = (Linklist1*) malloc (sizeof(Linklist1));
		printf("\n\n请输入第%d个人的账号  密码\n", ++i);
		char username[10], password[10];
		scanf("%s %s", username, password);
		strcpy(stu->username, username);
		strcpy(stu->password, password);
		end->next = stu;
		end = stu;
		printf("Continue?(Y/N)");//输入y或Y以继续输入下一个同学的基本信息
		choice = getch();
	} while (choice == 'Y' || choice == 'y');
	end->next = NULL;
	return head;
}
Linklist* readstudent(char* filename) {
	Linklist* head, *end, *stu;
	FILE* fp;
	if ((fp = fopen(filename, "rt")) == NULL) {
		printf("读文件出错，按任意键退出！");
		getch(); 
		exit(1);
	}
	head = (Linklist*) malloc (sizeof(Linklist));
	head->next = NULL;
	end = head;
	while (!feof(fp)) {
		stu = (Linklist*) malloc (sizeof(Linklist));	
		fscanf(fp, "%s %s %s %d %d %d", stu->name, stu->number, stu->Class, &stu->Chinese, &stu->Math, &stu->English);
		end->next = stu;
		end = stu;
	}
	end->next = NULL;
	fclose(fp);
	printf("\n文件中信息已正确读出，按任意键返回！\n");
	getch();
	return head;
}
//建立链表并输入学生基本信息  教师添加学生信息时用 
Linklist* create() {
	Linklist* head, *end, *stu;
	int i = 0;
	char choice;
	head = (Linklist*) malloc (sizeof(Linklist));
	head->next = NULL;
	end = head;
	do {
		stu = (Linklist*) malloc (sizeof(Linklist));
		printf("\n\n请输入第%d个人的信息：\n", ++i);
		printf("\n姓名    学号    班级    语文成绩    数学成绩    英语成绩：\n"); 
		scanf("%s %s %s %d %d %d", stu->name, stu->number, stu->Class, &stu->Chinese, &stu->Math, &stu->English);
		end ->next = stu;
		end = stu;
		printf("Continue?(Y/N)");//输入y或Y以继续输入下一个同学的基本信息
		choice = getch();
	} while (choice == 'Y' || choice == 'y');
	end->next = NULL;
	return head;
}
// 教师添加学生成绩时用 
void savestudent(Linklist* head, char* filename) {
	Linklist* stu;
	FILE* fp;
	if ((fp = fopen(filename, "wt")) == NULL) {
		printf("写入文件出错，请按任意键退出！");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s %s %d %d %d\n", stu->name, stu->number, stu->Class, stu->Chinese, stu->Math, stu->English);
	}
	printf("\n文件已成功保存，请按任意键返回！\n");
	getch(); 
	fclose(fp);
}
void zaisavestudent(Linklist* head, char* filename) {
	Linklist* stu;
	FILE* fp;
	if ((fp = fopen(filename, "at")) == NULL) {
		printf("写入文件出错，请按任意键退出！");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s %s %d %d %d\n", stu->name, stu->number, stu->Class, stu->Chinese, stu->Math, stu->English);
	}
	printf("\n文件已成功保存，请按任意键返回！\n");
	getch(); 
	fclose(fp);
}
void readyourscore(char* filename, char* account) {
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
            i = 1;
            printf("\n%s %s %s %d %d %d\n", head->next->name, head->next->number, head->next->Class, head->next->Chinese, head->next->Math, head->next->English);
            printf("\n打印完成\n");
			printf("\n按任意键返回\n");
			getch();
			Sleep(3000);
	        system("cls");
			studentmenu(account); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n输入信息有误，请重新输入\n");
        readyourscore(filename, account);
    }
}
void readyourclassscore(char* filename, char* account) {
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    Linklist* head1 = (Linklist*)malloc(sizeof(struct student));
    head1 = head->next;
    while (head) {
        if (strcmp(head->number, account) == 0) {
            i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 1) {
        while(head1->next) {
            printf("%-10s %-10s %-10s %-10d %-10d %-10d\n", head1->name, head1->number, head1->Class, head1->Chinese, head1->Math, head1->English);
            head1 = head1->next;
        }
        printf("\n查询已完成\n");
        printf("\n按任意键返回\n");
		getch();
		Sleep(3000);
	    system("cls");
        studentmenu(account);
    }
    if(i == 0) {
        printf("\n输入信息有误，请重新输入\n");
        readyourclassscore(filename, account);
    }
}
void score1sort(char* filename, char* account) {
    Linklist* head = readstudent(filename);
    Linklist* head1 = head->next;
    int a[1000], k = 0;
    while (head1) {
    	a[k++] = head1->Chinese;
    	head1 = head1->next;
	}
	int score;
	while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
        score = head->next->Chinese;
        break;
		}
		head = head->next;
	}
	int i, j, temp;
	for (i = 0; i < k; i++) {
		for (j = 0; j < k - i - 1; j++) {
			if (a[j] < a[j + 1]) {
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
	for (i = 0; i < k; i++) {
		if (a[i] == score) {
            printf("你的英语成绩为第%d名", i + 1);
            printf("\n查询已完成\n");
            printf("\n按任意键返回\n");
		    getch();
		    Sleep(3000);
	        system("cls");
            studentmenu(account);
		}
	}
}
void score2sort(char* filename, char* account) {
    Linklist* head = readstudent(filename);
    Linklist* head1 = head->next;
    int a[1000], k = 0;
    while (head1) {
    	a[k++] = head1->Math;
    	head1 = head1->next;
	}
	int score;
	while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
        score = head->next->Math;
        break;
		}
		head = head->next;
	}
	int i, j, temp;
	for (i = 0; i < k; i++) {
		for (j = 0; j < k - i - 1; j++) {
			if (a[j] < a[j + 1]) {
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
	for (i = 0; i < k; i++) {
		if (a[i] == score) {
            printf("你的高数成绩为第%d名", i + 1);
            printf("\n查询已完成\n");
            printf("\n按任意键返回\n");
	      	getch();
		    Sleep(3000);
	        system("cls");
            studentmenu(account);
		}
	}
}
void score3sort(char* filename, char* account) {
    Linklist* head = readstudent(filename);
    Linklist* head1 = head->next;
    int a[1000], k = 0;
    while (head1) {
    	a[k++] = head1->English;
    	head1 = head1->next;
	}
	int score;
	while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
        score = head->next->English;
        break;
		}
		head = head->next;
	}
	int i, j, temp;
	for (i = 0; i < k; i++) {
		for (j = 0; j < k - i - 1; j++) {
			if (a[j] < a[j + 1]) {
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
	for (i = 0; i < k; i++) {
		if (a[i] == score) {
            printf("你的英语成绩为第%d名", i + 1);
            printf("\n查询已完成\n");
            printf("\n按任意键返回\n");
	        getch();
		    Sleep(3000);
	        system("cls");
            studentmenu(account);
		}
	}
}
void allscoresort(char* filename, char* account) {
    Linklist* head = readstudent(filename);
    Linklist* head1 = head->next;
    int a[1000], k = 0;
    while (head1) {
    	a[k++] = head1->Math + head1->Chinese + head1->English;
    	head1 = head1->next;
	}
	int score;
	while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
        score = head->next->Math + head->next->Chinese + head->next->English;
        break;
		}
		head = head->next;
	}
	int i, j, temp;
	for (i = 0; i < k; i++) {
		for (j = 0; j < k - i - 1; j++) {
			if (a[j] < a[j + 1]) {
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
	for (i = 0; i < k; i++) {
		if (a[i] == score) {
            printf("你的总分成绩为第%d名", i + 1);
            printf("\n查询已完成\n");
            printf("\n按任意键返回\n");
		    getch();
		    Sleep(3000);
	        system("cls");
            studentmenu(account);
		}
	}
    
}
void scoreanalyse(char* filename, char* account) {
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    while (head) {
        if (strcmp(head->number, account) == 0) {
            i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 1) {
    printf("\n查询总分请输入4\n\n查询语文成绩输入1\n\n查询高数成绩输入2\n\n查询大英输入3\n\n否则重新输入");
    printf("\n请输入菜单编号\n");
    char x[100];
    scanf("%s",x);
    fflush(stdin);//清缓冲区
    if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if(x[0] == '1') {
            score1sort(filename, account);
        } else if(x[0] == '2') {
            score2sort(filename, account);
        }else if(x[0] == '3') {
            score3sort(filename, account);
        }else if(x[0] == '4') {
            allscoresort(filename, account); 
        } else {
        	printf("\n请重新输入1-4的数：\n");
            scoreanalyse(filename, account);
		}
    } else {
        printf("\n请重新输入1-4的数：\n");
        scoreanalyse(filename, account);
    }
}
    if(i == 0) {
        printf("输入信息有误，请重新输入");
        scoreanalyse(filename, account);
    }
    
}
void scorestate(char* account) {
	FILE *fp;
	fp = fopen("学生成绩申诉.txt", "a");
	char s[1000];
	printf("\n请给管理员留言！\n");
	scanf("%s", s);
	fprintf(fp, "%s %s\n", account, s);
	fclose(fp);
	printf("\n申诉成功\n");
    printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
    studentmenu(account);
}

 //登录成功后显示的菜单(此处为学生菜单)
int studentmenu(char username1[]) {
	fflush(stdin);
	int flag = 0;
	char filename[20];
	if (username1[1] == '1') {
        strcpy(filename, "class1.txt");
    } else if (username1[1] == '2') {
        strcpy(filename, "class2.txt");
    } else if (username1[1] == '3') {
        strcpy(filename, "class3.txt");
    } else if (username1[1] == '4') {
        strcpy(filename, "class4.txt");
    } else if (username1[1] == '5') {
        strcpy(filename, "class5.txt");
    }
	char num1[LEN1]; 
	Linklist1* head1;//账户 
	Linklist* head;  //学生  
	printf("请选择指令：\n\n");
	printf("            1.    成 绩 查 询\n\n");
	printf("            2.    查 询 本 班 成 绩\n\n");
	printf("            3.    成 绩 分 析\n\n"); 
	printf("            4.    成 绩 申 诉\n\n"); 
	printf("            5.    返 回 上 一 层\n\n"); 
	printf("            0.    退 出\n\n"); 
	printf("请输入指令：");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 0)) {
		fflush(stdin);
		system("cls");
		printf("\n输入了错误的指令（请输入0~5的指令）\n");
		printf("请选择指令：\n\n");
		printf("            1.    成 绩 查 询\n\n");
		printf("            2.    查 询 本 班 成 绩\n\n");
		printf("            3.    成 绩 分 析\n\n"); 
		printf("            4.    成 绩 申 诉\n\n"); 
		printf("            5.    返 回 上 一 层\n\n"); 
		printf("            0.    退 出\n\n");
		printf("\n请重新输入：");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n您已退出成功！\n");
		flag = 1;
		return flag;
	}
	if (num1[0] - '0' == 1) {
		readyourscore(filename, username1);
	}
	if (num1[0] - '0' == 2) {
	    readyourclassscore(filename, username1);
	}
	if (num1[0] - '0' == 3) {
		scoreanalyse(filename, username1);
	}
	if (num1[0] - '0' == 4) {
		scorestate(username1);
	}
	if (num1[0] - '0' == 5) {
		system("cls");
		menu();
	}
}
int juge (char* username, char* filename) {
	Linklist* head = (Linklist*)malloc(sizeof(Linklist));
    head = readstudent(filename);
    int i = 1;
    while (head->next) {
    	if (strcmp(head->next->number, username) == 0) {
    		i = 0;
    		break;
		}
		head = head->next;
	}
	return i;
}
Linklist* delete1student(Linklist* head, char* filename) {
	Linklist* head2 = head;
	Linklist* head1 = head; 
    while (head2->next) {
        if (juge(head2->next->number, filename) == 0) {
            head2->next = head2->next->next;
        }
        head2 = head2->next;
    }
    return head1;
}
void addstudent(char* filename, char* account) {
	Linklist*  head = create();
	Linklist* head2 = delete1student(head, filename);
	zaisavestudent(head2, filename);
	printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account);
}
void deletestudent(char* filename, char* account1) {
	char account[10];
	printf("\n请输入你要删除学生的账号\n");
	scanf("%s", account);
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
	Linklist* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->number, account) == 0) {
            head->next = head->next->next;
			i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 1 ) {
    	savestudent(head1, filename);
    	printf("\n按任意键退出\n");
	    getch();
	    Sleep(3000);
	    system("cls");
    	teachermenu(account1);
	}
    if (i == 0) {
    	printf("\n该学生不存在，请重新输入\n"); 
		deletestudent(filename, account1); 
	}
}
void rewritestudent(char* filename, char* account1) {
	char account[10];
	printf("\n请输入你要修改学生的账号\n");
	scanf("%s", account);
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
	Linklist* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->number, account) == 0) {
            printf("\n请重新输入学生的信息\n");
			char name[LEN1];//学生姓名
	        char number[LEN1];//学生学号
	        char Class[LEN1];//学生班级
	        int Chinese;//语文成绩
	        int Math;//数学成绩
	        int English;
	        scanf("%s %s %s %d %d %d", name, number, Class, &Chinese, &Math, &English);
	        strcpy(head->next->name, name);
	        strcpy(head->next->number, number);
	        strcpy(head->next->Class, Class);
	        head->next->Chinese = Chinese;
	        head->next->Math = Math;
	        head->next->English = English;
			i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 1) {
    	savestudent(head1, filename);
    	printf("\n按任意键退出\n");
	    getch(); 
	    Sleep(3000);
	    system("cls");
	    teachermenu(account1);
	}
    if (i == 0) {
    	printf("\n该学生不存在，请重新输入\n"); 
		rewritestudent(filename, account); 
	}
} 
void lookyourstudent(char* filename, char* account1) {
    printf("\n请输入你要查询学生的学号\n");
    char account[20];
    scanf("%s", account);
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
            i = 1;
            printf("%s %s %s %d %d %d\n", head->next->name, head->next->number, head->next->Class, head->next->Chinese, head->next->Math, head->next->English);
            printf("\n打印完成\n");
			printf("\n按任意键返回\n");
			getch();
		    Sleep(3000);
	        system("cls");
			teachermenu(account1); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n输入信息有误，请重新输入\n");
        lookyourstudent(filename, account1);
    }
}
void lookyourclass(char* filename, char* account1) {
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    Linklist* head1 = head->next;
    while(head1->next) {
        printf("%-5s %-5s %-5s %-3d %-3d %-3d\n", head1->name, head1->number, head1->Class, head1->Chinese, head1->Math, head1->English);
        head1 = head1->next;
        }
    printf("\n查询已完成\n");
    printf("\n按任意键返回\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account1);
}
void download(char* filename) {
	Linklist* head = readstudent(filename);
	char filename1[10];
	printf("\n请输入你要保存的文件名\n");
	savestudent(head, filename1);
	Sleep(3000);
	system("cls");
}
void Hchinese(Linklist* head) {
	Linklist* r = head->next;
	int count = 0, sum = 0;
	while (r) {
		count++;
		sum += r->Chinese;
		r = r->next;
	}
	int averge = sum / count;
	printf("\n本班的语文平均成绩是%d分\n", averge);
	int max = 0, count1 = 0, count2 = 0;
	Linklist* p =  head->next;
	while (p) {
		if (p->Chinese >= 60) {
			count1++;
		} else {
			count2++;
		}
		if (max < p->Chinese) {
			max = p->Chinese;
		} 
		p = p->next;
	}
	printf("\n本班语文成绩的最高分是%d分\n\n及格的人数为%d人\n\n不及格的人数为%d人\n\n",max, count1, count2); 
}
void Hmath(Linklist* head) {
	Linklist* r = head->next;
	int count = 0, sum = 0;
	while (r) {
		count++;
		sum += r->Math;
		r = r->next;
	}
	int averge = sum / count;
	printf("\n本班的高数平均成绩是%d分\n", averge);
	int max = 0, count1 = 0, count2 = 0;
	Linklist* p =  head->next;
	while (p) {
		if (p->Math >= 60) {
			count1++;
		} else {
			count2++;
		}
		if (max < p->Math) {
			max = p->Math;
		} 
		p = p->next;
	}
	printf("\n本班高数成绩的最高分是%d分\n\n及格的人数为%d人\n\n不及格的人数为%d人\n\n", max, count1, count2); 
}
void Henglish(Linklist* head) {
	Linklist* r = head->next;
	int count = 0, sum = 0;
	while (r) {
		count++;
		sum += r->English;
		r = r->next;
	}
	int averge = sum / count;
	printf("\n本班的英语平均成绩是%d分\n", averge);
	int max = 0, count1 = 0, count2 = 0;
	Linklist* p =  head->next;
	while (p) {
		if (p->English >= 60) {
			count1++;
		} else {
			count2++;
		}
		if (max < p->English) {
			max = p->English;
		} 
		p = p->next;
	}
	printf("\n本班英语成绩的最高分是%d分\n\n及格的人数为%d人\n\n不及格的人数为%d人\n\n", max , count1, count2); 
}
void Hallscore(Linklist* head) {
	Linklist* r = head->next;
	int count = 0, sum = 0;
	while (r) {
		count++;
		sum += r->English + r->Math + r->Chinese;
		r = r->next;
	}
	int averge = sum / count;
	printf("\n本班的总分平均成绩是%d分\n", averge);
	int max = 0, count1 = 0, count2 = 0;
	Linklist* p =  head->next;
	int all;
	while (p) {
		all = p->Chinese + p->English + p->Math; 
		if (max < all) {
			max = all;
		} 
		p = p->next;
	}
	printf("\n本班总分成绩的最高分是%d分\n", all);
} 
void analyseyourclass(char*filename, char* account1) {
     Linklist* head = readstudent(filename);
     Hchinese(head);
     Hmath(head);
     Henglish(head);
     Hallscore(head);
     printf("\n查询已完成\n");
     printf("\n按任意键返回\n");
	 getch();
	 Sleep(3000);
	 system("cls");
	 teachermenu(account1);
     
}
void remindmanager(char* account1) {
	char a[10];
	printf("\n请输入你的提醒\n"); 
	scanf("%s", a);
	FILE* fp = fopen("代办选项.txt", "at");
	if (fp == NULL) {
		printf("\n打开文件错误\n");
		getch();
		fclose(fp); 
	} 
	fprintf(fp, "%s", a);
	printf("\n提醒成功\n");
	printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account1);
	
}
//登录成功后显示的菜单（此处为教师端菜单）
int teachermenu(char username1[]) {
	fflush(stdin);
	int flag = 0;
	char filename[20];
	if (username1[1] == '1') {
        strcpy(filename, "class1.txt");
    } else if (username1[1] == '2') {
        strcpy(filename, "class2.txt");
    } else if (username1[1] == '3') {
        strcpy(filename, "class3.txt");
    } else if (username1[1] == '4') {
        strcpy(filename, "class4.txt");
    } else if (username1[1] == '5') {
        strcpy(filename, "class5.txt");
    }
	char num1[LEN1];  
	printf("请选择指令：\n\n");
	printf("            1.    增 加 新 的 学 生 信 息\n\n");
	printf("            2.    删 除 学 生 信 息\n\n");
	printf("            3.    修 改 学 生 信 息\n\n"); 
	printf("            4.    查 询 学 生 信 息\n\n"); 
	printf("            5.    输 出 本 班 成 绩\n\n"); 
	printf("            6.    下 载 到 文 件 中\n\n");
	printf("            7.    成 绩 分 析\n\n");
	printf("            8.    提 醒 管 理 员 进 行 成 绩 的 更 新\n\n");
	printf("            9.    返 回 上 一 层\n\n");
	printf("            0.    退 出\n\n"); 
	printf("请输入指令：");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 6 && num1[0] - '0' != 7 && num1[0] - '0' != 8 && num1[0] - '0' != 9 && num1[0] - '0' != 0)) {
		fflush(stdin);
		system("cls");
		printf("\n输入了错误的指令（请输入0~9的指令）\n");
		printf("请选择指令：\n\n");
		printf("            1.    增 加 新 的 学 生 信 息\n\n");
		printf("            2.    删 除 学 生 信 息\n\n");
		printf("            3.    修 改 学 生 信 息\n\n"); 
		printf("            4.    查 询 学 生 信 息\n\n"); 
		printf("            5.    输 出 本 班 成 绩\n\n"); 
		printf("            6.    下 载 到 文 件 中\n\n");
		printf("            7.    成 绩 分 析\n\n");
		printf("            8.    提 醒 管 理 员 进 行 成 绩 的 更 新\n\n");
		printf("            9.    返 回 上 一 层\n\n");
		printf("            0.    退 出\n\n");
		printf("\n请重新输入：");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n您已退出成功！\n");
		flag = 0;
		return flag;
	}
	if (num1[0] - '0' == 1) {
		addstudent(filename, username1);
	}
	if (num1[0] - '0' == 2) {
		deletestudent(filename, username1);
	}
	if (num1[0] - '0' == 3) {
		rewritestudent(filename, username1);
	}
	if (num1[0] - '0' == 4) {
		lookyourstudent(filename, username1);
	}
	if (num1[0] - '0' == 5) {
		lookyourclass(filename, username1);
	}
	if (num1[0] - '0' == 6) {
		download(filename);
	}
	if (num1[0] - '0' == 7) {
		analyseyourclass(filename, username1); 
	}
	if (num1[0] - '0' == 8) {
		remindmanager(username1);
	}
	if (num1[0] - '0' == 9) {
		system("cls");
		menu();	
	}
} 
void lookdaiban(char* account) {
	char s[1000];
	char a[1000];
    FILE *fp1;
    fp1 = fopen("学生成绩申诉.txt", "r");
    printf("\n学生:\n");
     while (!feof(fp1)) {
	fscanf(fp1, "%s", &a);
	printf("%s\n", a);
    }
    fclose(fp1);
    FILE* fp;
    printf("\n教师:\n");
    fp = fopen("代办选项.txt", "r");
     while (!feof(fp)) {
	fscanf(fp, "%s", &s);
	printf("%s\n", s);
    }
    fclose(fp);
    printf("\n成功查看\n");
    printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
	managemenu(account);
}
int juge (char* username) {
	Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    int i = 1;
    while (head->next) {
    	if (strcmp(head->next->username, username) == 0) {
    		i = 0;
		}
		head = head->next;
	}
	return i;
}
Linklist1* delete1account(Linklist1* head) {
	Linklist1* head2 = head;
	Linklist1* head1 = head; 
    while (head2->next) {
        if (juge(head2->next->username) == 0) {
            head2->next = head2->next->next;
        }
        head2 = head2->next;
    }
    return head1;
}
void addaccount(char* account) {
	Linklist1*  head = create1();
	Linklist1* head2 = delete1account(head);
	zaisaveaccount(head2);
	printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
	managemenu(account);
}
void deleteaccount(char* account1){
	char account[10];
	printf("\n请输入你要删除的账号\n");
	scanf("%s", account);
    int i = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
	Linklist1* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->username, account) == 0) {
            head->next = head->next->next;
			i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 1 ) {
    	save1account(head1);
    	printf("\n按任意键退出\n");
	    getch();
	    Sleep(3000);
	    system("cls");
	    managemenu(account1);
	}
    if (i == 0) {
    	printf("\n该账号不存在，请重新输入\n"); 
		deleteaccount(account1); 
	}
}
void rewriteaccount(char* account1){
	char account[10];
	printf("\n请输入你要修改的账号\n");
	scanf("%s", account);
    int i = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
	Linklist1* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->username, account) == 0) {
            printf("\n请重新输入账号的信息\n");
			char username[LEN1];
	        char password[LEN1];
	        scanf("%s %s", username, password);
	        strcpy(head->next->username, username);
	        strcpy(head->next->password, password);
			i = 1;
            break;
        }
        head = head->next;
    }
    if (i ==1 ) {
    	save1account(head1);
    	printf("\n按任意键退出\n");
	    getch();
	    Sleep(3000);
	    system("cls");
	    managemenu(account1);
	}
    if (i == 0) {
    	printf("\n该账号不存在，请重新输入\n"); 
		rewriteaccount(account1); 
	}
}
void findaccount() {
	char account[10];
	printf("\n请输入账号来寻找密码\n");
	scanf("%s", account);
    int i = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount(); 
    while (head->next) {
        if (strcmp(head->next->username, account) == 0) {
            printf("%s", head->next->password);
            i = 1;
            break;
        }
        head = head->next;
    }
    if (i == 0) {
    	printf("\n该账号不存在，请重新输入\n"); 
		findaccount(); 
	}
}
void printall(char* account) {
	Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    Linklist1* head1 = head->next;
	while (head1) {
		printf("%s %s\n", head1->username, head1->password);
		head1 = head1->next;
	}
	printf("\n打印完成\n");
	printf("\n按任意键退出\n");
	getch();
	Sleep(3000);
	system("cls");
	managemenu(account);
	 
}
void add1student(char* account) {
	char filename[20];
	printf("\n请选择学生要录入的班级\n");
    printf("\n请输入班级编号\n");
    char x[100];
    scanf("%s",x);
    fflush(stdin);
    if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
        	strcpy(filename, "class1.txt");
        }
        if (x[0] == '2') {
            strcpy(filename, "class2.txt");
        }
        if (x[0] == '3') {
            strcpy(filename, "class3.txt");
        }
        if (x[0] == '4') {
            strcpy(filename, "class4.txt");
        }
        if (x[0] == '5') {
            strcpy(filename, "class5.txt");	
		}
    } else {
        printf("\n请重新输入1-5的数：\n");
        add1student(account);
    }
    Linklist* head = create();
	zaisavestudent(head, filename);
	printf("\n按任意键退出\n");
	getch(); 
	Sleep(3000);
	system("cls");
	managemenu(account);
}
void enter1teachermenu() {
	Linklist1* head = readaccount();
	char account[10];
	Linklist1* head1 = head->next;
	while (head1) {
		if (head1->username[1] == '1' && head1->username[0] == '1') {
			strcpy(account, head1->username);
			break;
		}
		head1 = head1->next;
	}
	teachermenu(account);
}
void enter2teachermenu() {
		Linklist1* head = readaccount();
	char account[10];
	Linklist1* head1 = head->next;
	while (head1) {
		if (head1->username[1] == '2' && head1->username[0] == '1') {
			strcpy(account, head1->username);
			break;
		}
		head1 = head1->next;
	}
	teachermenu(account);
}
void enter3teachermenu() {
		Linklist1* head = readaccount();
	char account[10];
	Linklist1* head1 = head->next;
	while (head1) {
		if (head1->username[1] == '3' && head1->username[0] == '1') {
			strcpy(account, head1->username);
			break;
		}
		head1 = head1->next;
	}
	teachermenu(account);
}
void enter4teachermenu() {
		Linklist1* head = readaccount();
	char account[10];
	Linklist1* head1 = head->next;
	while (head1) {
		if (head1->username[1] == '4' && head1->username[0] == '1') {
			strcpy(account, head1->username);
			break;
		}
		head1 = head1->next;
	}
	teachermenu(account);
}
void enter5teachermenu() {
	Linklist1* head = readaccount();
	char account[10];
	Linklist1* head1 = head->next;
	while (head1) {
		if (head1->username[1] == '5' && head1->username[0] == '1') {
			strcpy(account, head1->username);
			break;
		}
		head1 = head1->next;
	}
	teachermenu(account);
}
void enterteachermenu() {
	printf("请输入你要进入的班级的班号\n"); 
	char x[100];
    scanf("%s",x);
    fflush(stdin);//清缓冲区
    if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
            enter1teachermenu();
        }
        if (x[0] == '2') {
            enter2teachermenu();
        }
        if (x[0] == '3') {
            enter3teachermenu();
        }
        if (x[0] == '4') {
             enter4teachermenu();
        }
        if (x[0] == '5') {
        	enter5teachermenu();
		}
    } else {
        printf("请重新输入1-5的数：\n");
        enterteachermenu();
    }
}
int managemenu(char username1[]) {
	fflush(stdin);
	int flag = 0;
	char num1[LEN1]; 
	printf("请选择指令：\n\n");
	printf("            1.    查 看 代 办 选 项\n\n");
	printf("            2.    进 入 教 师 端 进 行 信 息 修 改\n\n");
	printf("            3.    增 加 账 号 及 密 码\n\n"); 
	printf("            4.    删 除 账 号 及 密 码\n\n"); 
	printf("            5.    修 改 账 号 及 密 码\n\n"); 
	printf("            6.    查 找 账 号 及 密 码\n\n");
	printf("            7.    录 入 所 有 账 号 及 密 码\n\n");
	printf("            8.    输 出 所 有 账 号 及 密 码\n\n");
	printf("            9.    手 动 录 入 学 生 信 息\n\n");
	printf("            a.    返 回 到 上 一 层\n\n");
	printf("            0.    退 出\n\n"); 
	printf("请输入指令：");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 6 && num1[0] - '0' != 7 && num1[0] - '0' != 8 && num1[0] - '0' != 9 && num1[0] - '0' != 0 && num1[0] != 'a')) {
		fflush(stdin);
		system("cls");
		printf("\n输入了错误的指令（请输入0~9及a的指令）\n");
		printf("请选择指令：\n\n");
		printf("            1.    查 看 代 办 选 项\n\n");
		printf("            2.    进 入 教 师 端 进 行 信 息 修 改\n\n");
		printf("            3.    增 加 账 号 及 密 码\n\n"); 
		printf("            4.    删 除 账 号 及 密 码\n\n"); 
		printf("            5.    修 改 账 号 及 密 码\n\n"); 
		printf("            6.    查 找 账 号 及 密 码\n\n");
		printf("            7.    录 入 所 有 账 号 及 密 码\n\n");
		printf("            8.    输 出 所 有 账 号 及 密 码\n\n");
		printf("            9.    手 动 录 入 学 生 信 息\n\n");
		printf("            a.    返 回 到 上 一 层\n\n");
		printf("            0.    退 出\n\n");
		printf("\n请重新输入：");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n您已退出成功！\n");
		flag = 0;
		return flag;
	}
	if (num1[0] - '0' == 1) {
		lookdaiban(username1);
	}
	if (num1[0] - '0' == 2) {
		enterteachermenu();
	}
	if (num1[0] - '0' == 3) {
		addaccount(username1);
	}
	if (num1[0] - '0' == 4) {
		deleteaccount(username1);
	}
	if (num1[0] - '0' == 5) {
		rewriteaccount(username1);
	}
	if (num1[0] - '0' == 6) {
		findaccount();
	}
	if (num1[0] - '0' == 7) {
		addaccount(username1);	
	}
	if (num1[0] - '0' == 8) {
		printall(username1);
	}
	if (num1[0] - '0' == 9) {
		add1student(username1);
	}
	if (num1[0] == 'a') {
		system("cls");
		menu();
	}
}
void secretpassword(char* password) {
	unsigned char ch;
	int i = 0;
	while((ch = getch()) != '\r') {
		if (i < 20 && isprint(ch)) {
			password[i++] = ch;
			putchar('*'); 
		} else if (i > 0 && ch == '\b') {
			i--;
			putchar('\b');//删除 password 
			putchar(' ');
			putchar('\b'); 
		}
	}
	printf("\n");
	password[i] = '\0';
}
void studentregister() {
	char username[20];
    printf("\n请输入你要注册的账号\n");
    scanf("%s", username);
    char filename[20];
	if (username[1] == '1') {
        strcpy(filename, "class1.txt");
    } else if (username[1] == '2') {
        strcpy(filename, "class2.txt");
    } else if (username[1] == '3') {
        strcpy(filename, "class3.txt");
    } else if (username[1] == '4') {
        strcpy(filename, "class4.txt");
    } else if (username[1] == '5') {
        strcpy(filename, "class5.txt");
    }
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    int flage = 0;
    head = readstudent(filename);
    while (head) {
        if (strcmp(head->number, username) == 0) {
            flage = 1;
            break;
        }
        head = head->next;
    }
    if (flage == 0) {
        printf("\n账号不存在 请重新输入\n");
        studentregister();
    }
    flage = 0;
    Linklist1* head1 = (Linklist1*)malloc(sizeof(struct user));
    head1 = readaccount();
    while (head1->next) {
        if (strcmp(head1->next->username, username) == 0) {
            flage = 1;
            break;
        }
        head1 = head1->next;
    }
    if (flage == 1) {
        printf("\n账号已注册 请重新输入\n");
        studentregister();
    }
    char password1[20];
    printf("\n请输入密码\n");
    secretpassword(password1);
    char password2[20];
    printf("\n请再次确定你的密码\n");
    secretpassword(password2);
    if (strcmp(password1, password2) == 0) {
        printf("\n注册成功\n");
        Linklist1* head3 = (Linklist1*)malloc(sizeof(struct user));
        strcpy(head3->username, username);
        strcpy(head3->password, password1);
        saveaccount(head3);
        Sleep(3000);
	    system("cls");
        menu();
    } else {
        printf("\n密码不匹配, 请重新输入\n");
        studentregister();
    }
    
}
void teacherregister() {
	char username[20];
    printf("\n请输入你要注册的账号账号的首位为1\n");
    scanf("%s", username);
    int flage = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(struct user));
    head = readaccount();
    Linklist1* head1 = head->next;
    while (head1) {
        if (strcmp(head1->username, username) == 0) {
            flage = 1;
            break;
        }
        head1 = head1->next;
    }
    if (flage == 1) {
        printf("\n账号已存在请重新输入\n");
        studentregister();
    }
    char password1[20];
    printf("\n请输入密码\n");
    secretpassword(password1);
    char password2[20];
    printf("\n请再次确定你的代码\n");
    secretpassword(password2);
    if (strcmp(password1, password2) == 0) {
        printf("\n注册成功\n");
        Linklist1* head3 = (Linklist1*)malloc(sizeof(struct user));
        strcpy(head3->username, username);
        strcpy(head3->password, password1);
        saveaccount(head3);
        Sleep(3000);
	    system("cls");
        menu(); 
    } else {
        printf("\n密码不匹配, 请重新输入\n");
        teacherregister();
    }
    
}
void studentlogin() {
	printf("学生登录界面\n");
	char username[10];
    printf("\n请输入你的账号\n");
    printf("账号首位为0\n");
    scanf("%s", username);
    char password[10];
    printf("\n请输入你的密码\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("登陆成功\n");
            Sleep(3000);
	        system("cls");
            studentmenu(username);
        }
        head = head->next;
    }
    if (i == 0) {
    printf("你的账号或密码有误\n");
    printf("重新输入请输入1\n返回上一界面请任意输入\n");
	char x[100];
    scanf("%s",x);
    fflush(stdin);//清缓冲区
    if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
            studentlogin();
        } else {
            menu();
        } 
    }
}
}
void teacherlogin() {
	printf("教师登录界面\n");
	char username[20];
    printf("\n请输入你的账号\n");
    printf("\n账号首位为1\n");
    scanf("%s", username);
    char password[20];
    printf("\n请输入你的密码\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("\n登陆成功\n");
            Sleep(3000);
	        system("cls");
	        teachermenu(username);
            break;
        }
        head = head->next;
    }
    if (i == 0) {
        printf("\n账号或密码错误, 请重新输入\n");
        printf("\n重新输入请输入1\n\n返回上一界面请任意输入\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//清缓冲区
        if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
            teacherlogin();
        } else {
            menu();
        } 
    }
    }
}
void managerlogin() {
	printf("管理员登录界面\n");
	char username[20];
    printf("\n请输入你的账号\n");
    printf("\n账号首位为2\n");
    scanf("%s", username);
    char password[20];
    printf("\n请输入你的密码\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("\n登陆成功\n");
            Sleep(3000);
	        system("cls");
	        managemenu(username);
			break;
        }
        head = head->next;
    }
    if (i == 0) {
        printf("\n账号或密码错误, 请重新输入\n");
        printf("\n重新输入请输入1\n\n返回上一界面请任意输入\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//清缓冲区
        if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
            managerlogin();
        } else {
            menu();
        } 
    }
    }
}
void findbackpassword() {
    /*char account[5];
    printf("\n请输入你的账号\n");
    scanf("%s", account);
    int flarge = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    Linklist1* head1 = head->next;
    while (head1) {
        if (strcmp(head1->username, account) == 0) {
            flarge = 1;
            printf("%s", head1->password);
            printf("\n找回密码成功\n");
            printf("\n按任意键返回\n");
            system("cls");
            menu();
        }
        head1 = head1->next;
    }
    if (flarge == 0) {
        printf("\n账号不存在， 请重新输入\n");
        findbackpassword();
    }*/
    int i = 0;
    char account[5];
    printf("\n请输入你的账号\n");
    scanf("%s", account);
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    while (head->next) {
        if ( strcmp(head->next->username, account) == 0) {
            i = 1;
            printf("\n%s\n", head->next->password);
            printf("\n打印完成\n");
			printf("\n按任意键返回\n");
			getch();
			Sleep(3000);
	        system("cls");
			menu(); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n账号不存在， 请重新输入\n");
        printf("\n重新输入请输入1\n\n返回上一界面请任意输入\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//清缓冲区
        if (strlen(x) == 1) {//通过字符串的长度来控制输入的字符串
        if (x[0] == '1') {
            findbackpassword();
        } else {
            menu();
        } 
    }
    }
}
//主菜单界面 
void menu() {
	system("cls");
	fflush(stdin);
	char num[LEN1];
	Linklist1* head1; 
	printf(" \n\n==================== 学 生 信 息 管 理 系 统 ====================\n\n");
	printf("******************** 请选择登录方式 ********************\n\n");
	printf("            1.    学 生 登 录\n\n");
	printf("            2.    教 师 登 录\n\n"); 
	printf("            3.    管 理 员 登 录\n\n");
	printf("            4.    学 生 注 册\n\n");
	printf("            5.    教 师 注 册\n\n");
	printf("            6.    找回密码\n\n");
	printf("            0.    退 出\n\n");
	printf(" 请选择：");
	scanf("%s", num);
	Sleep(3000);
	system("cls");
	while (num[1] != '\0' || (num[0] - '0' != 1 && num[0] - '0' != 2 && num[0] - '0' != 3 && num[0] - '0' != 4 && num[0] - '0' != 5&& num[0] - '0' != 6)) {
		fflush(stdin);
		system("cls");
		printf("\n输入了错误的指令（请输入0~5的指令）\n");
		printf("******************** 请选择登录方式 ********************\n\n");
		printf("            1.    学 生 登 录\n\n");
		printf("            2.    教 师 登 录\n\n"); 
		printf("            3.    管 理 员 登 录\n\n");
		printf("            4.    学 生 注 册\n\n");
		printf("            5.    教 师 注 册\n\n");
		printf("            0.    退 出\n\n");
		printf("\n请重新输入：");
		scanf("%s", num);
	}
	if (num[0] - '0' == 0) {
		system("cls");
		printf("您已成功退出");
	}
	if (num[0] - '0' == 1) {
		studentlogin();	 
	} 
	if (num[0] - '0' == 2) {
	    teacherlogin();
	}
	if (num[0] - '0' == 3) {
		managerlogin();
	}
	if (num[0] - '0' == 4) {
		studentregister();
	}
	if (num[0] - '0' == 5) {
		teacherregister();
	}
	if (num[0] - '0' == 6) {
		findbackpassword();
	}
	
} 

//主函数 
int main(void) {
	menu();
	//主菜单界面 
	return 0;
}
