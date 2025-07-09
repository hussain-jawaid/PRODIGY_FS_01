import useAuthCheck from "../hooks/useAuthCheck";

function ProtectedRoute({ children }) {
  const loading = useAuthCheck();
  if (loading)
    return (
      <div className="flex h-screen w-full items-center justify-center">
        <div className="flex flex-col items-center gap-2">
          <div className="flex h-16 w-16 animate-spin items-center justify-center rounded-full border-4 border-gray-300 border-t-blue-500"></div>
          <div>Checking Authentication...</div>
        </div>
      </div>
    );
  return children;
}

export default ProtectedRoute;
