#!/bin/bash

# 🍽️ 만원요리 최씨남매 - 직원 명함 자동 생성 스크립트

echo "📇 직원 명함 생성을 시작합니다..."

# 직원 정보 배열 (이름, 직책, 전화번호, 이메일, 파일명)
declare -a employees=(
    "김철수|마케팅팀|010-1234-5678|kim@manwonyori.com|kim-cheolsu"
    "박민정|고객지원팀|010-8765-4321|park@manwonyori.com|park-minjung"
    "최영희|메뉴개발팀|010-2468-1357|choi@manwonyori.com|choi-younghee"
    "정대한|품질관리팀|010-1357-2468|jung@manwonyori.com|jung-daehan"
)

# 각 직원별 HTML 파일 생성
for employee in "${employees[@]}"; do
    IFS='|' read -r name title phone email filename <<< "$employee"
    
    echo "생성 중: $name ($filename.html)"
    
    # index.html을 복사하고 정보 수정
    cp index.html "$filename.html"
    
    # 이름 변경
    sed -i "s/<div class=\"name\">운영본부 이진용<\/div>/<div class=\"name\">$title $name<\/div>/g" "$filename.html"
    
    # 전화번호 변경
    sed -i "s/010-9770-2885/$phone/g" "$filename.html"
    sed -i "s/tel:010-9770-2885/tel:$phone/g" "$filename.html"
    
    # 이메일 변경
    sed -i "s/we@manwonyori.com/$email/g" "$filename.html"
    sed -i "s/mailto:we@manwonyori.com/mailto:$email/g" "$filename.html"
    
    # vCard 정보 변경
    sed -i "s/FN:이진용/FN:$name/g" "$filename.html"
    sed -i "s/TITLE:만원요리 최씨남매 운영본부/TITLE:만원요리 최씨남매 $title/g" "$filename.html"
    sed -i "s/이진용_만원요리최씨남매.vcf/${name}_만원요리최씨남매.vcf/g" "$filename.html"
    
    # 페이지 타이틀 변경
    sed -i "s/<title>만원요리 최씨남매 - 이진용<\/title>/<title>만원요리 최씨남매 - $name<\/title>/g" "$filename.html"
done

echo "✅ 직원 명함 생성 완료!"
echo ""
echo "📋 생성된 파일:"
ls -la *.html | grep -v index.html
echo ""
echo "🔗 접근 방법:"
echo "https://manwonyori.github.io/business-card/kim-cheolsu.html"
echo "https://manwonyori.github.io/business-card/park-minjung.html"
echo "..."