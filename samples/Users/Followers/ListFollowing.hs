module ListFollowing where

import qualified Github.Users.Followers as Github
import Data.List (intercalate)
import Data.Default (def)

main = do
  possibleUsers <- Github.usersFollowedBy def "mike-burns"
  putStrLn $ either (("Error: "++) . show)
                    (intercalate "\n" . map formatUser)
                    possibleUsers

formatUser = Github.githubOwnerLogin
