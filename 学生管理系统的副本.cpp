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
	char username[LEN2];//�û���
	char password[LEN2];//����
	struct user* next;//����ýڵ�ָ����һ���ڵ��ָ��
} Linklist1;
//�����ѧ����Ϣ������Ľṹ�� 
typedef struct student {
	char name[LEN1];//ѧ������
	char number[LEN1];//ѧ��ѧ��
	char Class[LEN1];//ѧ���༶
	int Chinese;//���ĳɼ�
	int Math;//��ѧ�ɼ�
	int English;//Ӣ��ɼ�
	struct student* next;//����ýڵ�ָ����һ���ڵ��ָ��
} Linklist;
void menu();
int studentmenu(char username1[]);
int teachermenu(char username1[]);
int managemenu(char username1[]);
Linklist1* readaccount() {//���˺�
    Linklist1* head, *end, *stu;
	FILE* fp;
	if ((fp = fopen("�˻�����.txt", "rt")) == NULL) {
		printf("���ļ�������������˳���");
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
	printf("\n�ļ�����Ϣ����ȷ����������������أ�\n");
	getch();
	return head;
	
    
}
void saveaccount(Linklist1* head) {//���˺�
    FILE* fp;
	if ((fp = fopen("�˻�����.txt", "at")) == NULL) {
		printf("д���ļ������밴������˳���");
		getch();
		exit(1); 
	}
    fprintf(fp,"%s %s\n", head->username, head->password);
    printf("\n�ļ��ѳɹ����棬�밴��������أ�\n");
	getch();
	fclose(fp); 
}
void save1account(Linklist1* head) {
	Linklist1* stu;
	FILE* fp;
	if ((fp = fopen("�˻�����.txt", "wt")) == NULL) {
		printf("д���ļ������밴������˳���");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s\n", stu->username, stu->password);
	}
	printf("\n�ļ��ѳɹ����棬�밴��������أ�\n");
	getch(); 
	fclose(fp);
}

void zaisaveaccount(Linklist1* head) {
	Linklist1* stu;
	FILE* fp;
	if ((fp = fopen("�˻�����.txt", "at")) == NULL) {
		printf("д���ļ������밴������˳���");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s\n", stu->username, stu->password);
	}
	printf("\n�ļ��ѳɹ����棬�밴��������أ�\n");
	getch(); 
	fclose(fp);
} 
Linklist1* create1() {//���������˺� 
	Linklist1* head, *end, *stu;
	int i = 0, n;
	char choice;
	head = (Linklist1*) malloc (sizeof(Linklist1));
	head->next = NULL;
	end = head;
	do {
		stu = (Linklist1*) malloc (sizeof(Linklist1));
		printf("\n\n�������%d���˵��˺�  ����\n", ++i);
		char username[10], password[10];
		scanf("%s %s", username, password);
		strcpy(stu->username, username);
		strcpy(stu->password, password);
		end->next = stu;
		end = stu;
		printf("Continue?(Y/N)");//����y��Y�Լ���������һ��ͬѧ�Ļ�����Ϣ
		choice = getch();
	} while (choice == 'Y' || choice == 'y');
	end->next = NULL;
	return head;
}
Linklist* readstudent(char* filename) {
	Linklist* head, *end, *stu;
	FILE* fp;
	if ((fp = fopen(filename, "rt")) == NULL) {
		printf("���ļ�������������˳���");
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
	printf("\n�ļ�����Ϣ����ȷ����������������أ�\n");
	getch();
	return head;
}
//������������ѧ��������Ϣ  ��ʦ���ѧ����Ϣʱ�� 
Linklist* create() {
	Linklist* head, *end, *stu;
	int i = 0;
	char choice;
	head = (Linklist*) malloc (sizeof(Linklist));
	head->next = NULL;
	end = head;
	do {
		stu = (Linklist*) malloc (sizeof(Linklist));
		printf("\n\n�������%d���˵���Ϣ��\n", ++i);
		printf("\n����    ѧ��    �༶    ���ĳɼ�    ��ѧ�ɼ�    Ӣ��ɼ���\n"); 
		scanf("%s %s %s %d %d %d", stu->name, stu->number, stu->Class, &stu->Chinese, &stu->Math, &stu->English);
		end ->next = stu;
		end = stu;
		printf("Continue?(Y/N)");//����y��Y�Լ���������һ��ͬѧ�Ļ�����Ϣ
		choice = getch();
	} while (choice == 'Y' || choice == 'y');
	end->next = NULL;
	return head;
}
// ��ʦ���ѧ���ɼ�ʱ�� 
void savestudent(Linklist* head, char* filename) {
	Linklist* stu;
	FILE* fp;
	if ((fp = fopen(filename, "wt")) == NULL) {
		printf("д���ļ������밴������˳���");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s %s %d %d %d\n", stu->name, stu->number, stu->Class, stu->Chinese, stu->Math, stu->English);
	}
	printf("\n�ļ��ѳɹ����棬�밴��������أ�\n");
	getch(); 
	fclose(fp);
}
void zaisavestudent(Linklist* head, char* filename) {
	Linklist* stu;
	FILE* fp;
	if ((fp = fopen(filename, "at")) == NULL) {
		printf("д���ļ������밴������˳���");
		getch();
		exit(1); 
	}
	for (stu = head->next; stu != NULL; stu = stu->next) {
		fprintf(fp,"%s %s %s %d %d %d\n", stu->name, stu->number, stu->Class, stu->Chinese, stu->Math, stu->English);
	}
	printf("\n�ļ��ѳɹ����棬�밴��������أ�\n");
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
            printf("\n��ӡ���\n");
			printf("\n�����������\n");
			getch();
			Sleep(3000);
	        system("cls");
			studentmenu(account); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n������Ϣ��������������\n");
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
        printf("\n��ѯ�����\n");
        printf("\n�����������\n");
		getch();
		Sleep(3000);
	    system("cls");
        studentmenu(account);
    }
    if(i == 0) {
        printf("\n������Ϣ��������������\n");
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
            printf("���Ӣ��ɼ�Ϊ��%d��", i + 1);
            printf("\n��ѯ�����\n");
            printf("\n�����������\n");
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
            printf("��ĸ����ɼ�Ϊ��%d��", i + 1);
            printf("\n��ѯ�����\n");
            printf("\n�����������\n");
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
            printf("���Ӣ��ɼ�Ϊ��%d��", i + 1);
            printf("\n��ѯ�����\n");
            printf("\n�����������\n");
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
            printf("����ֳܷɼ�Ϊ��%d��", i + 1);
            printf("\n��ѯ�����\n");
            printf("\n�����������\n");
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
    printf("\n��ѯ�ܷ�������4\n\n��ѯ���ĳɼ�����1\n\n��ѯ�����ɼ�����2\n\n��ѯ��Ӣ����3\n\n������������");
    printf("\n������˵����\n");
    char x[100];
    scanf("%s",x);
    fflush(stdin);//�建����
    if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
        if(x[0] == '1') {
            score1sort(filename, account);
        } else if(x[0] == '2') {
            score2sort(filename, account);
        }else if(x[0] == '3') {
            score3sort(filename, account);
        }else if(x[0] == '4') {
            allscoresort(filename, account); 
        } else {
        	printf("\n����������1-4������\n");
            scoreanalyse(filename, account);
		}
    } else {
        printf("\n����������1-4������\n");
        scoreanalyse(filename, account);
    }
}
    if(i == 0) {
        printf("������Ϣ��������������");
        scoreanalyse(filename, account);
    }
    
}
void scorestate(char* account) {
	FILE *fp;
	fp = fopen("ѧ���ɼ�����.txt", "a");
	char s[1000];
	printf("\n�������Ա���ԣ�\n");
	scanf("%s", s);
	fprintf(fp, "%s %s\n", account, s);
	fclose(fp);
	printf("\n���߳ɹ�\n");
    printf("\n��������˳�\n");
	getch();
	Sleep(3000);
	system("cls");
    studentmenu(account);
}

 //��¼�ɹ�����ʾ�Ĳ˵�(�˴�Ϊѧ���˵�)
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
	Linklist1* head1;//�˻� 
	Linklist* head;  //ѧ��  
	printf("��ѡ��ָ�\n\n");
	printf("            1.    �� �� �� ѯ\n\n");
	printf("            2.    �� ѯ �� �� �� ��\n\n");
	printf("            3.    �� �� �� ��\n\n"); 
	printf("            4.    �� �� �� ��\n\n"); 
	printf("            5.    �� �� �� һ ��\n\n"); 
	printf("            0.    �� ��\n\n"); 
	printf("������ָ�");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 0)) {
		fflush(stdin);
		system("cls");
		printf("\n�����˴����ָ�������0~5��ָ�\n");
		printf("��ѡ��ָ�\n\n");
		printf("            1.    �� �� �� ѯ\n\n");
		printf("            2.    �� ѯ �� �� �� ��\n\n");
		printf("            3.    �� �� �� ��\n\n"); 
		printf("            4.    �� �� �� ��\n\n"); 
		printf("            5.    �� �� �� һ ��\n\n"); 
		printf("            0.    �� ��\n\n");
		printf("\n���������룺");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n�����˳��ɹ���\n");
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
	printf("\n��������˳�\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account);
}
void deletestudent(char* filename, char* account1) {
	char account[10];
	printf("\n��������Ҫɾ��ѧ�����˺�\n");
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
    	printf("\n��������˳�\n");
	    getch();
	    Sleep(3000);
	    system("cls");
    	teachermenu(account1);
	}
    if (i == 0) {
    	printf("\n��ѧ�������ڣ�����������\n"); 
		deletestudent(filename, account1); 
	}
}
void rewritestudent(char* filename, char* account1) {
	char account[10];
	printf("\n��������Ҫ�޸�ѧ�����˺�\n");
	scanf("%s", account);
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
	Linklist* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->number, account) == 0) {
            printf("\n����������ѧ������Ϣ\n");
			char name[LEN1];//ѧ������
	        char number[LEN1];//ѧ��ѧ��
	        char Class[LEN1];//ѧ���༶
	        int Chinese;//���ĳɼ�
	        int Math;//��ѧ�ɼ�
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
    	printf("\n��������˳�\n");
	    getch(); 
	    Sleep(3000);
	    system("cls");
	    teachermenu(account1);
	}
    if (i == 0) {
    	printf("\n��ѧ�������ڣ�����������\n"); 
		rewritestudent(filename, account); 
	}
} 
void lookyourstudent(char* filename, char* account1) {
    printf("\n��������Ҫ��ѯѧ����ѧ��\n");
    char account[20];
    scanf("%s", account);
    int i = 0;
    Linklist* head = (Linklist*)malloc(sizeof(struct student));
    head = readstudent(filename);
    while (head->next) {
        if ( strcmp(head->next->number, account) == 0) {
            i = 1;
            printf("%s %s %s %d %d %d\n", head->next->name, head->next->number, head->next->Class, head->next->Chinese, head->next->Math, head->next->English);
            printf("\n��ӡ���\n");
			printf("\n�����������\n");
			getch();
		    Sleep(3000);
	        system("cls");
			teachermenu(account1); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n������Ϣ��������������\n");
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
    printf("\n��ѯ�����\n");
    printf("\n�����������\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account1);
}
void download(char* filename) {
	Linklist* head = readstudent(filename);
	char filename1[10];
	printf("\n��������Ҫ������ļ���\n");
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
	printf("\n���������ƽ���ɼ���%d��\n", averge);
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
	printf("\n�������ĳɼ�����߷���%d��\n\n���������Ϊ%d��\n\n�����������Ϊ%d��\n\n",max, count1, count2); 
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
	printf("\n����ĸ���ƽ���ɼ���%d��\n", averge);
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
	printf("\n��������ɼ�����߷���%d��\n\n���������Ϊ%d��\n\n�����������Ϊ%d��\n\n", max, count1, count2); 
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
	printf("\n�����Ӣ��ƽ���ɼ���%d��\n", averge);
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
	printf("\n����Ӣ��ɼ�����߷���%d��\n\n���������Ϊ%d��\n\n�����������Ϊ%d��\n\n", max , count1, count2); 
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
	printf("\n������ܷ�ƽ���ɼ���%d��\n", averge);
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
	printf("\n�����ֳܷɼ�����߷���%d��\n", all);
} 
void analyseyourclass(char*filename, char* account1) {
     Linklist* head = readstudent(filename);
     Hchinese(head);
     Hmath(head);
     Henglish(head);
     Hallscore(head);
     printf("\n��ѯ�����\n");
     printf("\n�����������\n");
	 getch();
	 Sleep(3000);
	 system("cls");
	 teachermenu(account1);
     
}
void remindmanager(char* account1) {
	char a[10];
	printf("\n�������������\n"); 
	scanf("%s", a);
	FILE* fp = fopen("����ѡ��.txt", "at");
	if (fp == NULL) {
		printf("\n���ļ�����\n");
		getch();
		fclose(fp); 
	} 
	fprintf(fp, "%s", a);
	printf("\n���ѳɹ�\n");
	printf("\n��������˳�\n");
	getch();
	Sleep(3000);
	system("cls");
	teachermenu(account1);
	
}
//��¼�ɹ�����ʾ�Ĳ˵����˴�Ϊ��ʦ�˲˵���
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
	printf("��ѡ��ָ�\n\n");
	printf("            1.    �� �� �� �� ѧ �� �� Ϣ\n\n");
	printf("            2.    ɾ �� ѧ �� �� Ϣ\n\n");
	printf("            3.    �� �� ѧ �� �� Ϣ\n\n"); 
	printf("            4.    �� ѯ ѧ �� �� Ϣ\n\n"); 
	printf("            5.    �� �� �� �� �� ��\n\n"); 
	printf("            6.    �� �� �� �� �� ��\n\n");
	printf("            7.    �� �� �� ��\n\n");
	printf("            8.    �� �� �� �� Ա �� �� �� �� �� �� ��\n\n");
	printf("            9.    �� �� �� һ ��\n\n");
	printf("            0.    �� ��\n\n"); 
	printf("������ָ�");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 6 && num1[0] - '0' != 7 && num1[0] - '0' != 8 && num1[0] - '0' != 9 && num1[0] - '0' != 0)) {
		fflush(stdin);
		system("cls");
		printf("\n�����˴����ָ�������0~9��ָ�\n");
		printf("��ѡ��ָ�\n\n");
		printf("            1.    �� �� �� �� ѧ �� �� Ϣ\n\n");
		printf("            2.    ɾ �� ѧ �� �� Ϣ\n\n");
		printf("            3.    �� �� ѧ �� �� Ϣ\n\n"); 
		printf("            4.    �� ѯ ѧ �� �� Ϣ\n\n"); 
		printf("            5.    �� �� �� �� �� ��\n\n"); 
		printf("            6.    �� �� �� �� �� ��\n\n");
		printf("            7.    �� �� �� ��\n\n");
		printf("            8.    �� �� �� �� Ա �� �� �� �� �� �� ��\n\n");
		printf("            9.    �� �� �� һ ��\n\n");
		printf("            0.    �� ��\n\n");
		printf("\n���������룺");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n�����˳��ɹ���\n");
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
    fp1 = fopen("ѧ���ɼ�����.txt", "r");
    printf("\nѧ��:\n");
     while (!feof(fp1)) {
	fscanf(fp1, "%s", &a);
	printf("%s\n", a);
    }
    fclose(fp1);
    FILE* fp;
    printf("\n��ʦ:\n");
    fp = fopen("����ѡ��.txt", "r");
     while (!feof(fp)) {
	fscanf(fp, "%s", &s);
	printf("%s\n", s);
    }
    fclose(fp);
    printf("\n�ɹ��鿴\n");
    printf("\n��������˳�\n");
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
	printf("\n��������˳�\n");
	getch();
	Sleep(3000);
	system("cls");
	managemenu(account);
}
void deleteaccount(char* account1){
	char account[10];
	printf("\n��������Ҫɾ�����˺�\n");
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
    	printf("\n��������˳�\n");
	    getch();
	    Sleep(3000);
	    system("cls");
	    managemenu(account1);
	}
    if (i == 0) {
    	printf("\n���˺Ų����ڣ�����������\n"); 
		deleteaccount(account1); 
	}
}
void rewriteaccount(char* account1){
	char account[10];
	printf("\n��������Ҫ�޸ĵ��˺�\n");
	scanf("%s", account);
    int i = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
	Linklist1* head1 = head; 
    while (head->next) {
        if (strcmp(head->next->username, account) == 0) {
            printf("\n�����������˺ŵ���Ϣ\n");
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
    	printf("\n��������˳�\n");
	    getch();
	    Sleep(3000);
	    system("cls");
	    managemenu(account1);
	}
    if (i == 0) {
    	printf("\n���˺Ų����ڣ�����������\n"); 
		rewriteaccount(account1); 
	}
}
void findaccount() {
	char account[10];
	printf("\n�������˺���Ѱ������\n");
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
    	printf("\n���˺Ų����ڣ�����������\n"); 
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
	printf("\n��ӡ���\n");
	printf("\n��������˳�\n");
	getch();
	Sleep(3000);
	system("cls");
	managemenu(account);
	 
}
void add1student(char* account) {
	char filename[20];
	printf("\n��ѡ��ѧ��Ҫ¼��İ༶\n");
    printf("\n������༶���\n");
    char x[100];
    scanf("%s",x);
    fflush(stdin);
    if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
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
        printf("\n����������1-5������\n");
        add1student(account);
    }
    Linklist* head = create();
	zaisavestudent(head, filename);
	printf("\n��������˳�\n");
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
	printf("��������Ҫ����İ༶�İ��\n"); 
	char x[100];
    scanf("%s",x);
    fflush(stdin);//�建����
    if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
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
        printf("����������1-5������\n");
        enterteachermenu();
    }
}
int managemenu(char username1[]) {
	fflush(stdin);
	int flag = 0;
	char num1[LEN1]; 
	printf("��ѡ��ָ�\n\n");
	printf("            1.    �� �� �� �� ѡ ��\n\n");
	printf("            2.    �� �� �� ʦ �� �� �� �� Ϣ �� ��\n\n");
	printf("            3.    �� �� �� �� �� �� ��\n\n"); 
	printf("            4.    ɾ �� �� �� �� �� ��\n\n"); 
	printf("            5.    �� �� �� �� �� �� ��\n\n"); 
	printf("            6.    �� �� �� �� �� �� ��\n\n");
	printf("            7.    ¼ �� �� �� �� �� �� �� ��\n\n");
	printf("            8.    �� �� �� �� �� �� �� �� ��\n\n");
	printf("            9.    �� �� ¼ �� ѧ �� �� Ϣ\n\n");
	printf("            a.    �� �� �� �� һ ��\n\n");
	printf("            0.    �� ��\n\n"); 
	printf("������ָ�");
	scanf("%s", num1);
	Sleep(3000);
	system("cls");
	while (num1[1] != '\0' || (num1[0] - '0' != 1 && num1[0] - '0' != 2 && num1[0] - '0' != 3 && num1[0] - '0' != 4 && num1[0] - '0' != 5 && num1[0] - '0' != 6 && num1[0] - '0' != 7 && num1[0] - '0' != 8 && num1[0] - '0' != 9 && num1[0] - '0' != 0 && num1[0] != 'a')) {
		fflush(stdin);
		system("cls");
		printf("\n�����˴����ָ�������0~9��a��ָ�\n");
		printf("��ѡ��ָ�\n\n");
		printf("            1.    �� �� �� �� ѡ ��\n\n");
		printf("            2.    �� �� �� ʦ �� �� �� �� Ϣ �� ��\n\n");
		printf("            3.    �� �� �� �� �� �� ��\n\n"); 
		printf("            4.    ɾ �� �� �� �� �� ��\n\n"); 
		printf("            5.    �� �� �� �� �� �� ��\n\n"); 
		printf("            6.    �� �� �� �� �� �� ��\n\n");
		printf("            7.    ¼ �� �� �� �� �� �� �� ��\n\n");
		printf("            8.    �� �� �� �� �� �� �� �� ��\n\n");
		printf("            9.    �� �� ¼ �� ѧ �� �� Ϣ\n\n");
		printf("            a.    �� �� �� �� һ ��\n\n");
		printf("            0.    �� ��\n\n");
		printf("\n���������룺");
		scanf("%s", num1);
	}
	if (num1[0] - '0' == 0) {
		system("cls");
		printf("\n�����˳��ɹ���\n");
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
			putchar('\b');//ɾ�� password 
			putchar(' ');
			putchar('\b'); 
		}
	}
	printf("\n");
	password[i] = '\0';
}
void studentregister() {
	char username[20];
    printf("\n��������Ҫע����˺�\n");
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
        printf("\n�˺Ų����� ����������\n");
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
        printf("\n�˺���ע�� ����������\n");
        studentregister();
    }
    char password1[20];
    printf("\n����������\n");
    secretpassword(password1);
    char password2[20];
    printf("\n���ٴ�ȷ���������\n");
    secretpassword(password2);
    if (strcmp(password1, password2) == 0) {
        printf("\nע��ɹ�\n");
        Linklist1* head3 = (Linklist1*)malloc(sizeof(struct user));
        strcpy(head3->username, username);
        strcpy(head3->password, password1);
        saveaccount(head3);
        Sleep(3000);
	    system("cls");
        menu();
    } else {
        printf("\n���벻ƥ��, ����������\n");
        studentregister();
    }
    
}
void teacherregister() {
	char username[20];
    printf("\n��������Ҫע����˺��˺ŵ���λΪ1\n");
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
        printf("\n�˺��Ѵ�������������\n");
        studentregister();
    }
    char password1[20];
    printf("\n����������\n");
    secretpassword(password1);
    char password2[20];
    printf("\n���ٴ�ȷ����Ĵ���\n");
    secretpassword(password2);
    if (strcmp(password1, password2) == 0) {
        printf("\nע��ɹ�\n");
        Linklist1* head3 = (Linklist1*)malloc(sizeof(struct user));
        strcpy(head3->username, username);
        strcpy(head3->password, password1);
        saveaccount(head3);
        Sleep(3000);
	    system("cls");
        menu(); 
    } else {
        printf("\n���벻ƥ��, ����������\n");
        teacherregister();
    }
    
}
void studentlogin() {
	printf("ѧ����¼����\n");
	char username[10];
    printf("\n����������˺�\n");
    printf("�˺���λΪ0\n");
    scanf("%s", username);
    char password[10];
    printf("\n�������������\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("��½�ɹ�\n");
            Sleep(3000);
	        system("cls");
            studentmenu(username);
        }
        head = head->next;
    }
    if (i == 0) {
    printf("����˺Ż���������\n");
    printf("��������������1\n������һ��������������\n");
	char x[100];
    scanf("%s",x);
    fflush(stdin);//�建����
    if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
        if (x[0] == '1') {
            studentlogin();
        } else {
            menu();
        } 
    }
}
}
void teacherlogin() {
	printf("��ʦ��¼����\n");
	char username[20];
    printf("\n����������˺�\n");
    printf("\n�˺���λΪ1\n");
    scanf("%s", username);
    char password[20];
    printf("\n�������������\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("\n��½�ɹ�\n");
            Sleep(3000);
	        system("cls");
	        teachermenu(username);
            break;
        }
        head = head->next;
    }
    if (i == 0) {
        printf("\n�˺Ż��������, ����������\n");
        printf("\n��������������1\n\n������һ��������������\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//�建����
        if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
        if (x[0] == '1') {
            teacherlogin();
        } else {
            menu();
        } 
    }
    }
}
void managerlogin() {
	printf("����Ա��¼����\n");
	char username[20];
    printf("\n����������˺�\n");
    printf("\n�˺���λΪ2\n");
    scanf("%s", username);
    char password[20];
    printf("\n�������������\n");
    secretpassword(password);
    Linklist1*  head = readaccount();
    int i = 0, k;
    while (head) {
        if (strcmp(head->username, username) == 0 && strcmp(head->password, password) == 0) {
            i = 1;
            printf("\n��½�ɹ�\n");
            Sleep(3000);
	        system("cls");
	        managemenu(username);
			break;
        }
        head = head->next;
    }
    if (i == 0) {
        printf("\n�˺Ż��������, ����������\n");
        printf("\n��������������1\n\n������һ��������������\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//�建����
        if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
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
    printf("\n����������˺�\n");
    scanf("%s", account);
    int flarge = 0;
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    Linklist1* head1 = head->next;
    while (head1) {
        if (strcmp(head1->username, account) == 0) {
            flarge = 1;
            printf("%s", head1->password);
            printf("\n�һ�����ɹ�\n");
            printf("\n�����������\n");
            system("cls");
            menu();
        }
        head1 = head1->next;
    }
    if (flarge == 0) {
        printf("\n�˺Ų����ڣ� ����������\n");
        findbackpassword();
    }*/
    int i = 0;
    char account[5];
    printf("\n����������˺�\n");
    scanf("%s", account);
    Linklist1* head = (Linklist1*)malloc(sizeof(Linklist1));
    head = readaccount();
    while (head->next) {
        if ( strcmp(head->next->username, account) == 0) {
            i = 1;
            printf("\n%s\n", head->next->password);
            printf("\n��ӡ���\n");
			printf("\n�����������\n");
			getch();
			Sleep(3000);
	        system("cls");
			menu(); 
            break;
        }
        head = head->next;
    }
    if(i == 0) {
        printf("\n�˺Ų����ڣ� ����������\n");
        printf("\n��������������1\n\n������һ��������������\n");
	    char x[100];
        scanf("%s",x);
        fflush(stdin);//�建����
        if (strlen(x) == 1) {//ͨ���ַ����ĳ���������������ַ���
        if (x[0] == '1') {
            findbackpassword();
        } else {
            menu();
        } 
    }
    }
}
//���˵����� 
void menu() {
	system("cls");
	fflush(stdin);
	char num[LEN1];
	Linklist1* head1; 
	printf(" \n\n==================== ѧ �� �� Ϣ �� �� ϵ ͳ ====================\n\n");
	printf("******************** ��ѡ���¼��ʽ ********************\n\n");
	printf("            1.    ѧ �� �� ¼\n\n");
	printf("            2.    �� ʦ �� ¼\n\n"); 
	printf("            3.    �� �� Ա �� ¼\n\n");
	printf("            4.    ѧ �� ע ��\n\n");
	printf("            5.    �� ʦ ע ��\n\n");
	printf("            6.    �һ�����\n\n");
	printf("            0.    �� ��\n\n");
	printf(" ��ѡ��");
	scanf("%s", num);
	Sleep(3000);
	system("cls");
	while (num[1] != '\0' || (num[0] - '0' != 1 && num[0] - '0' != 2 && num[0] - '0' != 3 && num[0] - '0' != 4 && num[0] - '0' != 5&& num[0] - '0' != 6)) {
		fflush(stdin);
		system("cls");
		printf("\n�����˴����ָ�������0~5��ָ�\n");
		printf("******************** ��ѡ���¼��ʽ ********************\n\n");
		printf("            1.    ѧ �� �� ¼\n\n");
		printf("            2.    �� ʦ �� ¼\n\n"); 
		printf("            3.    �� �� Ա �� ¼\n\n");
		printf("            4.    ѧ �� ע ��\n\n");
		printf("            5.    �� ʦ ע ��\n\n");
		printf("            0.    �� ��\n\n");
		printf("\n���������룺");
		scanf("%s", num);
	}
	if (num[0] - '0' == 0) {
		system("cls");
		printf("���ѳɹ��˳�");
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

//������ 
int main(void) {
	menu();
	//���˵����� 
	return 0;
}
