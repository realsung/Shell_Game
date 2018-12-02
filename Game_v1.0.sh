#!/bin/bash

function main_print(){ # 메인 옵션들 출력
	echo "◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎"
	echo "=                                                 ="
	echo -e "\033[1;31m=                  1. 겜 시작                     ="
	echo -e "\033[1;33m\033[0m""=                                                 ="
	echo -e "\033[1;31m=                  2. 도움말                      ="
	echo -e "\033[1;33m\033[0m""=                                                 ="
	echo -e "\033[1;31m=                  3. 종료                        ="
	echo -e "\033[1;33m\033[0m""=                                                 ="
	echo -e "\033[1;36m=  About : https://github.com/realsung/Shell_Game ="
	echo -e "\033[1;33m\033[0m""=                                                 ="
	echo -e "◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎-◎"
}

function menu(){ # 게임 메뉴들
	echo "[0] 뒤로가기"
	echo "[1] 숫자 맞추기 게임"
	echo "[?] 업데이트 예정..."
}

function game1(){ # 1. 숫자 맞추기 게임
	echo "숫자 맞추기 게임"
	echo "1 ~ 100 사이의 숫자를 입력 해주세요"
	rand=$(( ( $RANDOM % 100 ) + 1 )) # 랜덤 함수 사용해서 100까지 숫자중 랜덤 숫자 하나 지정
	for((i=0; i<=7; i++)); # 8번 반복
	do
		echo -e "\033[1;32m" # [*] Input 초록색 지정 
		printf "[*] Input : "
		read game1_input # 입력
		echo -e "\033[1;33m\033[0m" #나머지는 일반 색
		if [ ${rand} -eq ${game1_input} ]; then # 랜덤 값과 내가 입력한 값이 같으면 
			echo "You got it!!" # 잘했음
			break ;
		else
			if [ ${rand} -gt ${game1_input} ]; then # 내가 입력한 값이 랜덤 값보다 작으면
				echo "더 높은 수를 입력하세요"
			elif [ ${rand} -lt ${game1_input} ]; then # 내가 입력한 값이 랜덤 값보다 크면
				echo "더 낮은 수를 입력하세요"
			fi
		fi
	done
	sleep 2s
	echo ""
}

function helpme(){ # 도움말
	echo "[*] 게임 시작을 눌렀을 때 "
	sleep 1s
	echo "1. 숫자 맞추기 게임"
	sleep 1s
	echo "랜덤으로 숫자가 나옵니다."
	sleep 1s
	echo "당신은 8번의 기회가 있습니다"
	sleep 1s
	echo "1~100까지의 숫자 중에 하나를 맞추면 되는 게임입니다."
	sleep 3s
	echo ""
}

function end(){ # 종료
	echo "정말 종료할거야? ㅠ "
	sleep 0.5s
	echo "1. 종료"
	sleep 0.5s
	echo "2. 아니야"
	echo -e "\033[1;31m" # [*] Input 빨강색 지정 
	printf "[*] Input : "
	read exit 
	echo -e "\033[1;33m\033[0m" #나머지는 일반 색
	if [ ${exit} -eq 1 ]; then # 1 누르면 종료
		echo "Bye Bye ~"
		exit 0
	elif [ ${exit} -eq 2 ]; then #2 누르면 뒤로가기
		continue ;
	else
		echo "입력 값이 잘못됨"
	fi
	echo ""
}

while :
do
	main_print # 1,2,3 옵션 있는 거 출력
	echo -e "\033[1;32m" # [*] Input 초록색 지정 
	printf "[*] Input : "
	read input # 입력
	echo -e "\033[1;33m\033[0m" #나머지는 일반 색
	if [ ${input} -eq 1 ]; then #1번 눌렀을 때 game1 함수 실행
		menu # 메뉴함수 호출
		echo -e "\033[1;32m" # [*] Input 초롤색 지정 
		printf "[*] Input : "
		read memu_num # 입력
		echo -e "\033[1;33m\033[0m" #나머지는 일반 색
		if [ ${memu_num} -eq 0 ]; then # 메뉴 번호 = 0 뒤로가기
			echo ""
			continue ;
		elif [ ${memu_num} -eq 1 ]; then # 메뉴번호 = 1 숫자맞추기 게임
			game1
		else 
			echo "입력 값이 잘못됨"
			echo ""
		fi
	elif [ ${input} -eq 2 ]; then #2번 눌렀을 때 도움말들 
		helpme # 도움말 함수 호출
	elif [ ${input} -eq 3 ]; then #3번 눌렀을 때 종료 옵션
		end # 종료 함수 호출
	else
		echo "1,2,3중에 하나만 고르세요"
	fi
done
