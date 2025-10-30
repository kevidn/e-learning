class AuthCard extends HTMLElement {
    connectedCallback() {
        this.attachShadow({ mode: 'open' });
        this.shadowRoot.innerHTML = `
            <style>
                :host {
                    display: block;
                    background: rgba(255, 255, 255, 0.9);
                    backdrop-filter: blur(10px);
                    border-radius: 1rem;
                    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
                    padding: 2rem;
                    max-width: 28rem;
                    width: 100%;
                    border: 1px solid rgba(255, 255, 255, 0.2);
                }
                
                .header {
                    display: flex;
                    justify-content: center;
                    margin-bottom: 1.5rem;
                }
                
                .icon-container {
                    background: linear-gradient(135deg, #3B82F6 0%, #6366F1 100%);
                    padding: 0.75rem;
                    border-radius: 0.75rem;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                }
                
                .title {
                    font-size: 1.5rem;
                    line-height: 2rem;
                    font-weight: 700;
                    color: #1F2937;
                    margin-bottom: 0.5rem;
                    text-align: center;
                }
                
                .subtitle {
                    color: #6B7280;
                    text-align: center;
                    margin-bottom: 2rem;
                }
                
                ::slotted([slot="form"]) {
                    display: flex;
                    flex-direction: column;
                    gap: 1.25rem;
                }
                
                .footer {
                    margin-top: 1.5rem;
                    text-align: center;
                    color: #6B7280;
                    font-size: 0.875rem;
                    line-height: 1.25rem;
                }
                
                .link {
                    color: #3B82F6;
                    font-weight: 500;
                    transition: color 0.2s;
                }
                
                .link:hover {
                    color: #2563EB;
                }
            </style>
            
            <div class="header">
                <div class="icon-container">
                    <i data-feather="book-open" class="text-white"></i>
                </div>
            </div>
            
            <h1 class="title">${this.getAttribute('title') || 'Welcome Back'}</h1>
            <p class="subtitle">${this.getAttribute('subtitle') || 'Sign in to continue your learning journey'}</p>
            
            <slot name="form"></slot>
            
            <div class="footer">
                <slot name="footer"></slot>
            </div>
        `;
    }
}

customElements.define('auth-card', AuthCard);