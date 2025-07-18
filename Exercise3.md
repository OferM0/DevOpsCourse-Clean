## 🧪 Continuous Integration (CI) Workflow

This project includes a GitHub Actions workflow that automatically runs on every push to the main branch.
This CI pipeline automatically build and run test on the app.

### ✅ What It Does

The CI workflow:

1. **Checks out the code**
2. **Installs Node.js dependencies**
3. **Runs ESLint checks**
4. **Runs unit tests**

### 🧲 Trigger

The workflow runs automatically on:

yaml
on:
  push:
    branches:
      - main


Any push to the main branch will trigger the CI pipeline.

---

### 📁 Workflow File

Path: .github/workflows/ci.yml

### 🧱 CI Workflow Logic

yaml
    
    name: 🚀 CI Pipeline
  
        on:
          push:
            branches:
              - main
          pull_request:
            branches:
              - main
        
        jobs:
          backend-ci:
            name: Backend CI
            runs-on: ubuntu-latest
        
            defaults:
              run:
                working-directory: backend
        
            steps:
              - name: ⬇️ Checkout code
                uses: actions/checkout@v3
        
              - name: 🟢 Setup Node.js
                uses: actions/setup-node@v3
                with:
                  node-version: '18'
        
              - name: 📦 Install dependencies
                run: npm ci
        
              - name: 🧪 Run backend tests (if exists)
                run: |
                  if npm run | grep -q "test"; then
                    npm test
                  else
                    echo "No tests defined. Skipping..."
                  fi
        
              - name: ✅ Run lint checks (if exists)
                run: |
                  if npm run | grep -q "lint"; then
                    npm run lint
                  else
                    echo "No lint script defined. Skipping..."
                  fi
                  
          frontend-ci:
            name: Frontend CI
            runs-on: ubuntu-latest
        
            defaults:
              run:
                working-directory: frontend
        
            steps:
              - name: ⬇️ Checkout code
                uses: actions/checkout@v3
        
              - name: 🟢 Setup Node.js
                uses: actions/setup-node@v3
                with:
                  node-version: '18'
        
              - name: 📦 Install dependencies
                run: npm ci
        
              - name: 🧪 Run frontend tests (if exists)
                run: |
                  if npm run | grep -q "test"; then
                    npm test
                  else
                    echo "No tests defined. Skipping..."
                  fi
                  
              - name: ✅ Run lint checks (if exists)
                run: |
                  if npm run | grep -q "lint"; then
                    npm run lint
                  else
                    echo "No lint script defined. Skipping..."
                  fi
---

### 📸 Screenshots

| GitHub Actions tab showing successful CI run 
| -------------------------------------------- 
| ![CI Success](./screenshots/ci-success.png)  
