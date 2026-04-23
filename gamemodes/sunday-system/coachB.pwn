#define RECORDING "Bus2"
#define RECORDING_TYPE 1

#include <a_npc>
main(){}
public OnRecordingPlaybackEnd() 
{
    StartRecordingPlayback(RECORDING_TYPE, RECORDING);
    StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER, "all_around_lv_bus");
}
#if RECORDING_TYPE == 1
    public OnNPCEnterVehicle(vehicleid, seatid) StartRecordingPlayback(RECORDING_TYPE, RECORDING);
    public OnNPCExitVehicle() StopRecordingPlayback();
#else
    public OnNPCSpawn() StartRecordingPlayback(RECORDING_TYPE, RECORDING);
#endif
