import React, { useState, useEffect } from "react";
import axios from "axios";
import { FiSend, FiTrash2, FiLayers, FiPlus } from "react-icons/fi";
import { toast, Toaster } from "react-hot-toast";
import styles from "./ChatBot.module.css";

const ChatBot = () => {
  const [userInput, setUserInput] = useState("");
  const [chatHistory, setChatHistory] = useState([]);
  const [responseTime, setResponseTime] = useState("");
  const [generatedLayout, setGeneratedLayout] = useState("");
  const [description, setDescription] = useState("Description not available"); // Default description
  const [layoutData, setLayoutData] = useState([]);
  const [sqFt, setSqFt] = useState("");

  const initialChatHistory = [
    { role: "user", parts: "Hello" },
    {
      role: "model",
      parts:
        "Great to meet you, I'm Vastu_ChatBot. What would you like to know?",
    },
  ];

  const fetchChatHistory = async () => {
    try {
      await new Promise((resolve) => setTimeout(resolve, 2000));
      const { data } = await axios.get("http://localhost:8000/chat_history");
      setChatHistory(data.history);
      setResponseTime(data.current_time);
    } catch (error) {
      console.error("Error fetching chat history:", error);
    }
  };

  useEffect(() => {
    fetchChatHistory();
  }, []);

  const initializeChat = async () => {
    try {
      await axios.post("http://localhost:8000/clear_data");
      setChatHistory(initialChatHistory);
      setResponseTime("");
      setGeneratedLayout("");
      setDescription("Description not available"); // Reset to default
      setLayoutData([]);
      setSqFt("");
    } catch (error) {
      console.error("Error clearing or initializing data:", error);
    }
  };

  const handleChatSubmit = async () => {
    if (!userInput.trim()) return;

    try {
      const { data } = await axios.post("http://localhost:8000/chat", {
        user_input: userInput,
      });
      setChatHistory(data.history);
      setResponseTime(data.current_time);
      setUserInput("");
    } catch (error) {
      console.error("Error submitting chat:", error);
    }
  };

  const handleGenerateLayout = async () => {
    try {
      const { data } = await axios.get(
        "http://localhost:8000/generate_layout",
        {
          Sq_ft: sqFt,
        }
      );

      if (data.description && data.description.length > 0) {
        setDescription(
          data.description[0]?.error || "Description not available"
        );
      } else {
        setDescription("Description not available"); // Set default if no description
      }

      if (data.layout && data.layout.Dimension) {
        setLayoutData(data.layout.Dimension);
      }

      toast.success("Layout Generated");
    } catch (error) {
      console.error("Error generating layout:", error);
    }
  };

  const handleAddSqFt = () => {
    if (!sqFt || isNaN(sqFt)) {
      toast.error("Please enter a valid square footage value.");
      return;
    }
    console.log(`Square footage added: ${sqFt}`);
    setSqFt(""); // Reset input after adding
    toast.success(`Added ${sqFt} sq ft.`);
  };

  const handleKeyPress = (event) => {
    if (event.key === "Enter") handleChatSubmit();
  };

  const handleClearData = async () => {
    await initializeChat();
    toast.success("Cleared User Data");
  };

  return (
    <div>
      <Toaster position="bottom-left" />
      <div className={styles.mainContainer}>
        <div className={styles.leftSide}>
          <div className={styles.sqFtContainer}>
            <label htmlFor="sqFtInput">Square Footage :</label>
            <input
              id="sqFtInput"
              type="number"
              className={styles.sqFtInput}
              value={sqFt}
              onChange={(e) => setSqFt(e.target.value)}
              placeholder="Enter sq ft"
            />
            <button className={styles.iconButton} onClick={handleAddSqFt}>
              <FiPlus />
            </button>
          </div>

          <div className={styles.chatHistory}>
            {chatHistory.map((entry, index) => (
              <div key={index} className={styles.chatMessage}>
                <span className={styles.role}>
                  <strong>{entry.role === "user" ? "You: " : "Bot: "}</strong>
                </span>
                {entry.parts}
                <hr />
                {index === chatHistory.length - 1 && (
                  <span className={styles.time}>({responseTime})</span>
                )}
              </div>
            ))}
          </div>
          <div className={styles.inputContainer}>
            <input
              type="text"
              className={styles.inputBar}
              placeholder="Type your message..."
              value={userInput}
              onChange={(e) => setUserInput(e.target.value)}
              onKeyPress={handleKeyPress}
            />
            <button className={styles.iconButton} onClick={handleChatSubmit}>
              <FiSend />
            </button>
          </div>
        </div>
        <div className={styles.rightSide}>
          <div className={styles.descriptionText}>
            <h2>Description:</h2>
            <p>{description}</p>
          </div>

          {layoutData.length > 0 && (
            <div className={styles.layoutTable}>
              <h2>Room Layout</h2>
              <table className={styles.table}>
                <thead>
                  <tr>
                    <th>Room Type</th>
                    <th>Area</th>
                    <th>Length</th>
                    <th>Width</th>
                    <th>Max Aspect Ratio</th>
                    <th>Min Aspect Ratio</th>
                  </tr>
                </thead>
                <tbody>
                  {layoutData.map((room, index) => (
                    <tr key={index}>
                      <td>{room.room_type}</td>
                      <td>{room.area || "N/A"}</td>
                      <td>{room.length || "N/A"}</td>
                      <td>{room.width || "N/A"}</td>
                      <td>{room.max_aspect_ratio || "N/A"}</td>
                      <td>{room.min_aspect_ratio || "N/A"}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {!generatedLayout && !layoutData.length && (
            <div className={styles.infoMessage}>
              <h2>Welcome to Vastu-Bot</h2>
              <p>Here you can generate layouts and chat for assistance.</p>
            </div>
          )}

          <div className={styles.buttonContainer}>
            <button
              className={`${styles.iconButton} ${styles.generateLayout}`}
              onClick={handleGenerateLayout}
            >
              <FiLayers />
            </button>
            <button
              className={`${styles.iconButton} ${styles.clearButton}`}
              onClick={handleClearData}
            >
              <FiTrash2 />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ChatBot;
