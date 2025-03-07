import React from 'react';
import Header from './components/Header';
import ChatBot from './components/ChatBot'
import { Toaster } from "react-hot-toast";

function App() {
  return (
    <div>
      <Toaster />
      <Header/>
      <ChatBot/>
    </div>
  );  
}

export default App;
