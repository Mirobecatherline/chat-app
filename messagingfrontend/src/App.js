import './App.css';

import React, { useEffect, useRef, useState } from 'react'

function App({cable}) {
  const [messages,setMessages]=useState([])
  
  useEffect(() => {    
    
      cable.subscriptions.create
      (
        {channel: 'MessagesChannel'},
        {received: (message) => {setMessages([...messages, message])
          }
        }
      )
    
  }, [ cable.subscriptions, setMessages, messages])
    return (
    <div className="App">
      heloo
      
    </div>
  );
}

export default App;
