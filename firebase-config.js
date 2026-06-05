// Configuração do Firebase para a plataforma SaaS de Amor
// Cole as credenciais do seu projeto Firebase Console aqui:

const firebaseConfig = {
  apiKey: "AIzaSyANvkfustJfQ6ZtOU0g2wrKuHZ9mdW8igY",
  authDomain: "amor-no-ar.firebaseapp.com",
  projectId: "amor-no-ar",
  storageBucket: "amor-no-ar.firebasestorage.app",
  messagingSenderId: "71768701806",
  appId: "1:71768701806:web:e150b6865e626b4e621f7f",
  measurementId: "G-HSV2KLV168"
};

// Inicializa o Firebase (compat mode)
if (typeof firebase !== 'undefined') {
  if (!firebase.apps.length) {
    firebase.initializeApp(firebaseConfig);
  }
  window.auth = firebase.auth();
  window.db = firebase.firestore();
} else {
  console.error("SDK do Firebase não foi carregado. Verifique a conexão ou os scripts do CDN.");
}
