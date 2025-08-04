# 🔧 Render.com 자동 배포 설정 가이드

## 문제 해결: 자동 배포가 작동하지 않을 때

### 1. Render Dashboard에서 설정 확인

1. https://dashboard.render.com 접속
2. `manwon-business-card` 프로젝트 클릭
3. **Settings** 탭으로 이동

### 2. Auto-Deploy 설정 확인

**Build & Deploy** 섹션에서:
- **Auto-Deploy**: `Yes` 로 설정
- **Branch**: `main` 으로 설정

### 3. GitHub 연결 재설정 (필요시)

1. **Settings** → **Build & Deploy**
2. **Disconnect from GitHub** 클릭
3. **Connect to GitHub** 다시 클릭
4. `manwonyori/business-card` 저장소 선택
5. 권한 승인

### 4. 수동으로 Webhook 확인

GitHub 저장소에서:
1. Settings → Webhooks
2. Render webhook이 있는지 확인
3. 없다면 Render Dashboard에서:
   - **Settings** → **Build & Deploy**
   - **Deploy Hook** URL 복사
   - GitHub에 수동으로 추가

### 5. 테스트 방법

```bash
# 작은 변경사항 만들기
echo "<!-- Updated: $(date) -->" >> index.html

# 커밋 및 푸시
git add index.html
git commit -m "Test auto-deploy"
git push
```

### 6. Render Dashboard에서 확인

- **Events** 탭에서 새 배포가 시작되는지 확인
- 2-3분 후 사이트가 업데이트되는지 확인

## 🎯 render.yaml 설정 완료

```yaml
services:
  - type: web
    name: manwon-business-card
    runtime: static
    staticPublishPath: ./business-card  # 실제 파일 위치
    autoDeploy: true  # 자동 배포 활성화
```

## ✅ 체크리스트

- [ ] render.yaml이 저장소 루트에 있는가?
- [ ] Auto-Deploy가 Yes로 설정되어 있는가?
- [ ] Branch가 main으로 설정되어 있는가?
- [ ] GitHub 연결이 활성화되어 있는가?
- [ ] Webhook이 GitHub에 등록되어 있는가?

---

*자동 배포가 여전히 작동하지 않으면 Render Dashboard에서 수동으로 "Manual Deploy" 버튼을 사용할 수 있습니다.*