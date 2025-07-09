import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate("");

  const loginUser = async () => {
    try {
      const response = await fetch("http://localhost:8000/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          email: email,
          password: password,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        alert(`Login failed: ${data.detail}`);
        return;
      }

      localStorage.setItem("token", data.access_token);
      navigate("/");
      setEmail("");
      setPassword("");
    } catch (e) {
      alert("Network Error");
    }
  };

  const formSubmit = (e) => {
    e.preventDefault();
    loginUser();
  };

  return (
    <div className="flex h-screen w-full items-center justify-center bg-gray-100">
      <div className="h-auto w-full max-w-md rounded-2xl bg-black p-8 shadow-lg">
        <form onSubmit={(e) => formSubmit(e)} className="flex flex-col gap-6">
          <h1 className="mb-4 text-center text-3xl font-semibold text-white">
            Log In
          </h1>

          {/* Form fields */}
          <div className="flex flex-col gap-4">
            <div className="flex flex-col gap-2">
              <label className="text-sm font-medium text-white">Email</label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Enter your email"
                className="rounded-lg border border-gray-300 bg-gray-800 p-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
              />
            </div>
            <div className="flex flex-col gap-2">
              <label className="text-sm font-medium text-white">Password</label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Enter your password"
                className="rounded-lg border border-gray-300 bg-gray-800 p-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
              />
            </div>
            <button
              type="submit"
              className="mt-4 rounded-lg bg-blue-600 p-3 font-semibold text-white transition-colors duration-200 hover:bg-blue-700"
            >
              Log In
            </button>
          </div>
        </form>
        <p className="mt-4 text-center text-sm text-white">
          Don't have an account?{" "}
          <Link to="/signup" className="text-blue-400 hover:underline">
            Sign Up
          </Link>
        </p>
      </div>
    </div>
  );
}

export default Login;
