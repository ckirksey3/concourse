include "../shared.thrift"

namespace java com.cinchapi.concourse.server.management

service ConcourseManagementService {

   /**
     * Disable the user(i.e. the user cannot be authenticated for any purposes,
     * even with the correct password)
     *
     * @param username
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected
     */
   void disableUser(
     1: binary username,
	 2: shared.AccessToken creds);

   /**
     * Return a string that contains the dumps for all the storage units (i.e.
     * buffer, primary, secondary, search) in {@code environment} identified by
     * {@code id}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @param id
     * @param environment
     * @return the dump string
     */
  string dump(
	1: string id,
	2: string environment,
	3: shared.AccessToken creds);

   /**
     * Enable the user(i.e. the user can be authenticated with the correct
     * password).
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected   
     * @param username
     */
    void enableUser(
	1: binary username
	2: shared.AccessToken creds);
    
    /**
     * Return a string that contains a list of the ids in the
     * {@code environment} for all the blocks that can be dumped using
     * {@link #dump(String, String)}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected
     * @param environment
     * @return the dump list
     */
    string getDumpList(
	1: string environment
	2: shared.AccessToken creds);

    /**
     * Return the release version of the server.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @return the server Version string
     */
    string getServerVersion(
	1: shared.AccessToken creds);

    /**
     * Grant access to the user identified by the combination of
     * {@code username} and {@code password}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @param username
     * @param password
     */
    void grant(
	1: binary username,
	2: binary password,
	3: shared.AccessToken creds);

    /**
     * Return {@code true} if the server can be accessed
     * by a user identified by {@code username}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @param username
     * @return true/false
     */
    bool hasUser(
	1: shared.AccessToken creds,	
	2: binary username);

    /**
     * Install the plugin bundle contained in the {@code file}.
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @param bundle the path to the plugin bundle file
     */
    void installPluginBundle(
	1: shared.AccessToken creds,
	2: string file);

    /**
     * Return the names of all the environments that exist within Concourse
     * Server. An environment is said to exist if at least one user has
     * established a connection to that environment.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected* 
     * @return a string containing all of the environments
     */
    string listAllEnvironments(
	1: shared.AccessToken token);

    /**
     * Return a description of all the currently active user sessions within
     * Concourse Server.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @return a string containing all the user sessions
     */
    string listAllUserSessions(
	1: shared.AccessToken creds);

    /**
     * List all of the plugins that are available.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @return a String containing a list of all the available plugins
     */
    string listPluginBundles(
	1: shared.AccessToken creds);

    /**
     * Remove the user identified by {@code username}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected 
     * @param username
     */
    void revoke(
	1: binary username
 	2: shared.AccessToken creds);

    /**
     * Uninstall the plugin bundled referred to as {@code name}.
     *
     * @param creds the {@link shared.AccessToken} that is used to authenticate
     *                the user on behalf of whom the client is connected     
     * @param bundle the name of the plugin bundle
     */
    void uninstallPluginBundle(
	1: string name
	2: shared.AccessToken creds);

}
