import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

function useAuthCheck() {
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate("");

  useEffect(() => {
    const checkUser = async () => {
      const token = localStorage.getItem("token");
      if (!token) {
        navigate("/signup");
        return;
      }

      try {
        const response = await fetch("http://localhost:8000/auth/me", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (!response.ok) {
          navigate("/login");
          return;
        }

        const user = await response.json();
        localStorage.setItem("user", user);
      } catch (e) {
        navigate("/login");
      } finally {
        setLoading(false);
      }
    };

    checkUser();
  }, [navigate]);

  return loading;
}

export default useAuthCheck;
