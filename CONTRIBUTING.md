# Guia de Contribuição

Obrigado por considerar contribuir com o Ryuu! Este documento fornece diretrizes e padrões para contribuições.

## Código de Conduta

Este projeto segue um Código de Conduta. Ao participar, você concorda em seguir suas diretrizes.

## Como posso contribuir?

### Reportando Bugs 🐛

- Use o template de issue para bugs
- Inclua passos detalhados para reproduzir
- Mencione sua configuração (SO, versões, etc)

### Sugerindo Melhorias ✨

- Use o template de feature request
- Explique o caso de uso
- Seja específico sobre o comportamento desejado

### Código 👨‍💻

1. Fork o repositório
2. Clone seu fork
3. Crie uma branch para sua feature
4. Desenvolva seguindo os padrões do projeto
5. Escreva/atualize testes
6. Atualize a documentação
7. Envie um Pull Request

## Padrões de Commits com Gitmoji

Usamos gitmoji para manter nossos commits organizados e descritivos. Use os seguintes padrões:

### Principais

- ✨ `:sparkles:` Nova funcionalidade
- 🐛 `:bug:` Correção de bug
- 📝 `:memo:` Documentação
- ♻️ `:recycle:` Refatoração
- 🎨 `:art:` Formatação/estrutura do código
- ⚡️ `:zap:` Melhoria de performance
- 🔥 `:fire:` Remoção de código/arquivos

### Dependências

- ⬆️ `:arrow_up:` Upgrade de dependências
- ⬇️ `:arrow_down:` Downgrade de dependências
- ➕ `:heavy_plus_sign:` Adição de dependência
- ➖ `:heavy_minus_sign:` Remoção de dependência

### Testes

- ✅ `:white_check_mark:` Adição/atualização de testes
- 💚 `:green_heart:` Correção de CI
- 👷 `:construction_worker:` Adição/atualização de CI

### Frontend Específico

- 💄 `:lipstick:` UI/Estilo
- 🚸 `:children_crossing:` UX/Usabilidade
- ♿️ `:wheelchair:` Acessibilidade

### Backend Específico

- 🏗️ `:building_construction:` Mudanças na arquitetura
- 🗃️ `:card_file_box:` Mudanças no banco de dados
- 🔒️ `:lock:` Segurança

### Outros

- 🔧 `:wrench:` Configuração
- 📱 `:iphone:` Responsividade
- 💡 `:bulb:` Comentários
- 🚧 `:construction:` WIP (Trabalho em Progresso)

Exemplo de mensagens de commit:

```bash
git commit -m "✨ Adiciona sistema de login com Google"
git commit -m "🐛 Corrige erro no upload de imagens"
git commit -m "📝 Atualiza documentação da API"
git commit -m "🎨 Melhora estrutura do código do componente Reader"
```

Para commits com múltiplos propósitos:

```bash
git commit -m "✨ Adiciona dark mode ao leitor
🎨 Refatora sistema de temas
📝 Atualiza documentação"
```

## Processo de Review

### Checklist do PR

- [ ] Segue os padrões de commit com gitmoji
- [ ] Testes adicionados/atualizados
- [ ] Documentação atualizada
- [ ] Sem conflitos com a branch principal
- [ ] CI passing
- [ ] Preview deployment funcionando
- [ ] Code review aprovado por 2+ mantenedores

### Guia de Review

1. Legibilidade
    - Código é claro e auto-explicativo
    - Nomes de variáveis/funções são descritivos
    - Comentários onde necessário

2. Arquitetura
    - Segue os padrões do projeto
    - Componentes/funções reutilizáveis
    - Separação de responsabilidades

3. Performance
    - Consultas otimizadas
    - Carregamento eficiente
    - Não há memory leaks

4. Segurança
    - Inputs sanitizados
    - Autorizações verificadas
    - Dados sensíveis protegidos

## Dúvidas?

Abra uma issue com o gitmoji 💭 `:thought_balloon:` ou entre em contato com os mantenedores.